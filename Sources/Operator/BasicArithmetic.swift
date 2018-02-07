import Foundation

/// Defines types that may be be used within basic arithmetic operations. Protocol is used for internal
/// types to implement required methods properly, therefore the access is restricted to `internal`.
internal protocol BasicArithmetic {

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func += (lhs: inout Self, rhs: Self)

    /// Adds two values and produces their sum.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func + (lhs: Self, rhs: Self) -> Self

    /// Subtracts two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func -= (lhs: inout Self, rhs: Self)

    /// Subtracts one value from another and produces their difference.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func - (lhs: Self, rhs: Self) -> Self

    /// Multiplies two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func *= (lhs: inout Self, rhs: Self)

    /// Multiplies two values and produces their product.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func * (lhs: Self, rhs: Self) -> Self
}

extension BasicArithmetic {

    /// Adds two values and produces their sum.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func + (lhs: Self, rhs: Self) -> Self {
        var copy = lhs
        copy += rhs
        return copy
    }

    /// Subtracts one value from another and produces their difference.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func - (lhs: Self, rhs: Self) -> Self {
        var copy = lhs
        copy -= rhs
        return copy
    }

    /// Multiplies two values and produces their product.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func * (lhs: Self, rhs: Self) -> Self {
        var copy = lhs
        copy *= rhs
        return copy
    }
}
