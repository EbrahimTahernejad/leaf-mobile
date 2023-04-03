import Foundation

@_silgen_name("leaf_run")
    fileprivate func leafRun(
        _ rt_id: UInt16,
        _ config_path: UnsafePointer<CChar>!
    ) -> Int32
@_silgen_name("leaf_run_with_config_string")
    fileprivate func leafRunStr(
        _ rt_id: UInt16,
        _ config: UnsafePointer<CChar>!
    ) -> Int32
@_silgen_name("leaf_shutdown")
    fileprivate func leafShutdown(
        _ rt_id: UInt16
    ) -> Bool

public enum Leaf {
    public enum Error: Int32, Swift.Error {
        case configPath = 1 // ERR_CONFIG_PATH
        case config = 2 // ERR_CONFIG
        case io = 3 // ERR_IO
        case watcher = 4 // ERR_WATCHER
        case asyncChannelSend = 5 // ERR_ASYNC_CHANNEL_SEND
        case asyncChannelReceive = 6 // ERR_SYNC_CHANNEL_RECV
        case runtimeManager = 7 // ERR_RUNTIME_MANAGER
        case noConfigFile = 8 // ERR_NO_CONFIG_FILE
        case unknown = 99
        
        fileprivate init?(with rawValue: Int32) {
            guard rawValue != 0 else {
                return nil
            }
            guard let val = Error(rawValue: rawValue) else {
                self = .unknown
                return
            }
            self = val
        }
    }
    
    public enum Config {
        case file(path: String)
        case string(content: String)
    }
    
    public typealias Completion = (Error?) -> ()
    
    public static func start(with config: Config, identifier: UInt16 = 1, completionHandler: Completion? = nil) {
        DispatchQueue.global(qos: .userInitiated).async { [completionHandler, identifier, config] () in
            let result = { [config, identifier] () -> Int32 in
                switch config {
                case .file(let path):
                    return leafRun(identifier, path.cString(using: .utf8))
                case .string(let content):
                    return leafRunStr(identifier, content.cString(using: .utf8))
                }
            }()
            completionHandler?(Error(with: result))
        }
    }
    
    public static func stop(identifier: UInt16 = 1) -> Bool {
        return leafShutdown(identifier);
    }
}
