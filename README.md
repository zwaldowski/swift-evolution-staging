# Collection Splitting By Length

> **Note:** This package is a part of a Swift Evolution proposal for
  inclusion in the Swift standard library, and is not intended for use in
  production code at this time.

* Proposal: [SE-NNNN](https://github.com/apple/swift-evolution/proposals/NNNN-filename.md)
* Author(s): [Zachary Waldowski](https://github.com/zwaldowski)

## Introduction

Allows processing a Swift `Sequence` or `Collection` in chunks, an operation
sometimes desired in text processing, such as parsing some structured data.

```swift
import SE0000_SplitEvery

let formattedMAC = "0123456789ABCDEF"
    .split(every: 2)
    .joined(separator: ":")
    .uppercased()
print(formattedMAC)
// Prints "01:23:45:67:89:AB:CD:EF"
```

Like its stdlib cousin `split(maxSplits:omittingEmptySubsequences:whereSeparator:)`,
`split(every:)` is an eager operation that creates slices of the original collection. 

Similar to `split(maxSplits:omittingEmptySubsequences:whereSeparator:)`,
subsequences containing fewer than the requested maximum length are included.

```swift
let isValidMAC = "0123456789ABCDE"
    .split(every: 2)
    .allSatisfy { $0.count == 2 }
print(isValidMAC)
// Prints "false"
```

## Usage

To use this library in a Swift Package Manager project,
add the following to your `Package.swift` file's dependencies:

```swift
.package(
    url: "https://github.com/apple/swift-evolution-staging.git",
    .branch("SE0000_SplitEvery")),
```


