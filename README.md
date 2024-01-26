# Feather OpenAPI Kit

The `FeatherOpenAPIKit` library provides generic solutions for both OpenAPI objects.

## Current components:

- A generic solution for listing objects including filter, sort and page info.

## Getting started

⚠️ This repository is a work in progress, things can break until it reaches v1.0.0. 

Use at your own risk.

### Adding the dependency

To add a dependency on the package, declare it in your `Package.swift`:

```swift
.package(url: "https://github.com/feather-framework/feather-openapi-kit", .upToNextMinor(from: "0.5.0")),
```

and to your application target, add `FeatherKit` to your dependencies:

```swift
.product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit")
```

Example `Package.swift` file with `FeatherOpenAPIKit` as a dependency:

```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "my-application",
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-openapi-kit", .upToNextMinor(from: "0.5.0")),
    ],
    targets: [
        .target(name: "MyApplication", dependencies: [
            .product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit")
        ]),
        .testTarget(name: "MyApplicationTests", dependencies: [
            .target(name: "MyApplication"),
        ]),
    ]
)
```

