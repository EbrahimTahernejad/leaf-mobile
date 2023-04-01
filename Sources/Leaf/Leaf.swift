import LeafC
import Foundation

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
    
    public typealias Completion = (Error?) -> ()
    
    public static func start(with configPath: String, identifier: UInt16 = 1, completionHandler: @escaping Completion? = nil) {
        DispatchQueue.global(qos: .userInitiated).async { [completionHandler, identifier, configPath] () in
            let result = leaf_run(identifier, configPath.cString(using: .utf8))
            completionHandler?(Error(with: result))
        }
    }
    
    public static func stop(identifier: UInt16 = 1) -> Bool {
        leaf_shutdown(identifier);
    }
}
