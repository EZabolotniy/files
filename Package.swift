// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Files",
    products: [
        .library(
            name: "Files",
            targets: ["Files"]),
    ],
    targets: [
        .target(
            name: "Files")
    ]
)
