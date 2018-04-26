import Foundation

/// Defines types that support multiplicative operations
public protocol Multipliable {

    /// Multiplies `other` to `self`.
    ///
    /// - Parameters:
    ///   - lhs: The left hand side value to multiply with `rhs`
    ///   - rhs: The right hand side value to multiply to `self`.
    static func *= (lhs: inout Self, rhs: Self)

    /// Returns the product of multiplying `lhs` and `rhs`.
    ///
    /// - Parameters:
    ///   - lhs: The left hand side operant.
    ///   - rhs: The right hand side operant.
    /// - Returns: The multiplication result of `lhs` and `rhs`.
    static func * (lhs: Self, rhs: Self) -> Self
}
