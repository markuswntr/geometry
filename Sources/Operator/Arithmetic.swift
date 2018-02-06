import Foundation

/// Defines types that may be be used within arithmetic operations. It is used for types
/// to implement the methods properly, therefore the access is restricted to `internal`.
internal protocol Arithmetic {

    // MARK: Addition

    /// Adds two values and produces their sum.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func + (lhs: Self, rhs: Self) -> Self

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func += (lhs: inout Self, rhs: Self)

    // MARK: Substraction

    /// Subtracts one value from another and produces their difference.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func - (lhs: Self, rhs: Self) -> Self

    /// Subtracts two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func -= (lhs: inout Self, rhs: Self)

    // MARK: Multiplication

    /// Multiplies two values and produces their product.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func * (lhs: Self, rhs: Self) -> Self

    /// Multiplies two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func *= (lhs: inout Self, rhs: Self)
}
