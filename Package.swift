// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-openapi-kit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "FeatherOpenAPIKit", targets: ["FeatherOpenAPIKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", from: "3.1.0"),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "FeatherOpenAPIKit",
            dependencies: [
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPIKitTests",
            dependencies: [
                .target(name: "FeatherOpenAPIKit"),
                .product(name: "Yams", package: "Yams"),
            ],
            exclude: [
                "openapi.yaml"
            ]
        ),
    ]
)
