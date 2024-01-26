// swift-tools-version:5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "feather-openapi-kit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "FeatherOpenAPIKit", targets: ["FeatherOpenAPIKit"]),
        .library(name: "FeatherOpenAPIKitMacros", targets: ["FeatherOpenAPIKitMacros"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", from: "3.1.0"),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "FeatherOpenAPIKitMacrosKit",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "FeatherOpenAPIKitMacros",
            dependencies: [
                .target(name: "FeatherOpenAPIKitMacrosKit"),
            ]
        ),
        .target(
            name: "FeatherOpenAPIKit",
            dependencies: [
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPIKitTests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .target(name: "FeatherOpenAPIKit"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPIKitMacrosKitTests",
            dependencies: [
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
                .target(name: "FeatherOpenAPIKitMacrosKit"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPIKitMacrosTests",
            dependencies: [
                .target(name: "FeatherOpenAPIKitMacros"),
                .target(name: "FeatherOpenAPIKit"),
            ]
        ),
    ]
)
