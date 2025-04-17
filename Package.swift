// swift-tools-version:5.9.2

import PackageDescription

let package = Package(
    name: "FirebaseUtils9",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        .library(name: "FirebaseUtils9", targets: ["FirebaseUtils9"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "11.0.0"),
        .package(path: "../utils")
    ],
    targets: [
        .target(name: "FirebaseUtils9",
                dependencies: [
                    .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                    .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
                    .product(name: "Utils9", package: "utils")
                ],
                path: "Sources")
    ]
)
