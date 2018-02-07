import Foundation

/// Defines types that may be be used within extended arithmetic operations. Protocol is used for internal
/// types to implement required methods properly, therefore the access is restricted to `internal`.
internal protocol ExtendedArithmetic: BasicArithmetic {

    // MARK: Divide

    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable.
    ///
    /// For integer types, any remainder of the division is discarded.
    ///
    ///     var x = 21
    ///     x /= 5
    ///     // x == 4
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    static func /= (lhs: inout Self, rhs: Self)

    /// Returns the quotient of dividing the first value by the second.
    ///
    /// For integer types, any remainder of the division is discarded.
    ///
    ///     let x = 21 / 5
    ///     // x == 4
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    static func / (lhs: Self, rhs: Self) -> Self

    // MARK: Remainder

    /// Divides the first value by the second and stores the remainder in the
    /// left-hand-side variable.
    ///
    /// The result has the same sign as `lhs` and is less than `rhs.magnitude`.
    ///
    ///     var x = 22
    ///     x %= 5
    ///     // x == 2
    ///
    ///     var y = 22
    ///     y %= -5
    ///     // y == 2
    ///
    ///     var z = -22
    ///     z %= -5
    ///     // z == -2
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    static func %= (lhs: inout Self, rhs: Self)

    /// Returns the remainder of dividing the first value by the second.
    ///
    /// The result of the modulo operator (`%`) has the same sign as `lhs` and is
    /// less than `rhs.magnitude`.
    ///
    ///     let x = 22 % 5
    ///     // x == 2
    ///     let y = 22 % -5
    ///     // y == 2
    ///     let z = -22 % -5
    ///     // z == -2
    ///
    /// For any two integers `a` and `b`, their quotient `q`, and their remainder
    /// `r`, `a == b * q + r`.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    static func % (lhs: Self, rhs: Self) -> Self
}

extension ExtendedArithmetic {

    /// Returns the quotient of dividing the first value by the second.
    ///
    /// For integer types, any remainder of the division is discarded.
    ///
    ///     let x = 21 / 5
    ///     // x == 4
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func / (lhs: Self, rhs: Self) -> Self {
        var copy = lhs
        copy /= rhs
        return copy
    }

    /// Returns the remainder of dividing the first value by the second.
    ///
    /// The result of the modulo operator (`%`) has the same sign as `lhs` and is
    /// less than `rhs.magnitude`.
    ///
    ///     let x = 22 % 5
    ///     // x == 2
    ///     let y = 22 % -5
    ///     // y == 2
    ///     let z = -22 % -5
    ///     // z == -2
    ///
    /// For any two integers `a` and `b`, their quotient `q`, and their remainder
    /// `r`, `a == b * q + r`.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func % (lhs: Self, rhs: Self) -> Self {
        var copy = lhs
        copy /= rhs
        return copy
    }
}
