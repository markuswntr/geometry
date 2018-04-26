import Foundation

/// Defines types that support additive operations
public protocol Addible {

    /// Adds `other` to `self`.
    ///
    /// - Parameters:
    ///   - lhs: The left hand side value to which `rhs` should be added
    ///   - rhs: The right hand side value to add to `self`.
    static func += (lhs: inout Self, rhs: Self)

    /// Returns the sum of `lhs` and `rhs`.
    ///
    /// - Parameters:
    ///   - lhs: The left hand side operant.
    ///   - rhs: The right hand side operant.
    /// - Returns: The sum of `lhs` and `rhs`.
    static func + (lhs: Self, rhs: Self) -> Self
}
