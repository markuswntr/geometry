import Foundation

/// Defines types that may be be signed with either `+` or `-` prefix operators. It is used for
/// types to implement the methods properly, therefore the access is restricted to `internal`.
internal protocol SignedArithmetic {

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

extension SignedArithmetic {

    /// Returns the given number unchanged.
    ///
    /// - Returns: The given argument without any changes.
    public prefix static func + (operand: Self) -> Self {
        let copy = operand
        return copy
    }

    /// Returns the additive inverse of the specified value.
    ///
    /// - Returns: The additive inverse of this value.
    public prefix static func - (operand: Self) -> Self {
        var copy = operand
        copy.negate()
        return copy
    }
}
