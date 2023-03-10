// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Secp256k1Swift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Secp256k1Swift",
            targets: ["Secp256k1Swift"]),
        .library(
            name: "BIP32Swift",
            targets: ["BIP32Swift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.4.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "secp256k1"),
        .target(
            name: "BIP32Swift",
            dependencies: ["Secp256k1Swift", "BigInt", "CryptoSwift"]),
        .target(
            name: "Secp256k1Swift",
            dependencies: ["secp256k1"]),
        .testTarget(
            name: "Secp256k1SwiftTests",
            dependencies: ["Secp256k1Swift"]),
    ]
)
