import Foundation

/// Defines types that may be signed using either `+` or `-` as prefix operators.
public protocol Signable {

    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value
    mutating func negate()

    /// Returns the given number unchanged.
    ///
    /// - Returns: The given argument without any changes.
    prefix static func + (operand: Self) -> Self

    /// Returns the additive inverse of the specified value.
    ///
    /// - Returns: The additive inverse of this value.
    prefix static func - (operand: Self) -> Self
}
