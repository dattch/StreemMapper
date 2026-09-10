// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "StreemMapper",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "StreemMapper",
            targets: ["StreemMapper"]
        )
    ],
    targets: [
        .target(
            name: "StreemMapper",
            path: "Sources"
        ),
        .testTarget(
            name: "StreemMapperTests",
            dependencies: ["StreemMapper"],
            path: "StreemMapperTests",
            exclude: ["Info.plist"]
        )
    ]
)
