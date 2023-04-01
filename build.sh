#!/usr/bin/env sh

set -x

mode=release
release_flag=--release
package=leaf-ffi
name=leaf
lib=lib$name.a
libname=LibLeaf

# The script is assumed to run in the root of the workspace
base=$(dirname "$0")

# Debug or release build?
if [ "$1" = "debug" ]; then
	mode=debug
	release_flag=
fi

# Build for all desired targets
rustup target add aarch64-apple-ios
cargo build -p $package $release_flag --no-default-features --features "default-openssl" --target aarch64-apple-ios

# Directories to put the libraries.
rm -rf target/apple/$mode
mkdir -p target/apple/$mode/include
mkdir -p target/apple/$mode/ios
mkdir -p target/apple/$mode/macos

# Put built libraries to folders where we can find them easier later
cp target/aarch64-apple-ios/$mode/$lib target/apple/$mode/ios/
# Generate the header file
cbindgen \
	--config $package/cbindgen.toml \
	$package/src/lib.rs > target/apple/$mode/include/$name.h

wd="$base/../target/apple/$mode"

# Remove existing artifact
rm -rf "$wd/$libname.xcframework"

# A modulemap is required for the compiler to find the module when using Swift
cat << EOF > "$wd/include/module.modulemap"
module $libname {
    header "$name.h"
    export *
}
EOF

# Create the XCFramework packaging both iOS and macOS static libraries, so we can
# use a single XCFramework for both platforms.
xcodebuild -create-xcframework \
	-library "$wd/ios/$lib" \
	-headers "$wd/include" \
	-output "$wd/$libname.xcframework"

ls $wd/$libname.xcframework
