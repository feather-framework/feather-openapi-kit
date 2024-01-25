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
    ],
    dependencies: [
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", from: "3.1.0"),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "FeatherOpenAPIKitMacro",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "FeatherOpenAPIKit",
            dependencies: [
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
                .target(name: "FeatherOpenAPIKitMacro")
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPIKitTests",
            dependencies: [
                .target(name: "FeatherOpenAPIKit"),
                .product(name: "Yams", package: "Yams"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPIKitMacroTests",
            dependencies: [
                "FeatherOpenAPIKitMacro",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
