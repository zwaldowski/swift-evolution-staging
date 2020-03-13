//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2019 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

extension Collection {

    /// Returns the longest possible subsequences of the collection, in order,
    /// of a given length.
    ///
    /// The resulting array consists of subsequences of at most `maxLength`
    /// elements.
    ///
    /// Use this method to process a collection in batches or chunks.
    ///
    ///     let formattedMAC = "0123456789ABCDEF"
    ///         .split(every: 2)
    ///         .joined(separator: ":")
    ///         .uppercased()
    ///     print(formattedMAC)
    ///     // Prints "01:23:45:67:89:AB:CD:EF"
    ///
    /// - Parameters:
    ///   - maxLength: The maximum number of elements in each subsequence.
    ///     If the end of the collection has additional elements fewer than
    ///     `maxLength`, the last subsequence includes just those elements.
    /// - Returns: An array of subsequences, split from this collection's
    ///   elements.
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    /// - Precondition: `maxLength` must be greater than zero.
    @inlinable
    public __consuming func split(every maxLength: Int) -> [SubSequence] {
        precondition(maxLength > 0, "Must take one or more elements at a time")
        var result = [SubSequence]()
        var remaining = self[...]
        while !remaining.isEmpty {
            let chunk = remaining.prefix(maxLength)
            remaining = remaining.suffix(from: chunk.endIndex)
            result.append(chunk)
        }
        return result
    }

}
