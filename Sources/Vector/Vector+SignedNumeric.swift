import Foundation

extension Vector2D where Scalar: SignedNumeric {

    /// Returns the additive inverse of the specified value.
    ///
    /// The negation operator (prefix `-`) returns the additive inverse of its
    /// argument.
    ///
    ///     let x = Vector2D(a: 21, b: -30)
    ///     let y = -x
    ///     // y.a == -21
    ///     // y.b == 30
    ///
    /// The resulting value must be representable in the same type as the
    /// argument. In particular, negating a signed, fixed-width integer type's
    /// minimum results in a value that cannot be represented.
    ///
    ///     let z = -Int8.min
    ///     // Overflow error
    ///
    /// - Returns: The additive inverse of this value.
    prefix public static func - (operand: Self) -> Self {
        return .init(a: -operand.a, b: -operand.b)
    }

    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value of
    /// an integer `x`:
    ///
    ///     let x = Vector2D(a: 21, b: -30)
    ///     x.negate()
    ///     // x.a == -21
    ///     // x.b == 30
    public mutating func negate() {
        self = -self
    }
}

extension Vector3D where Scalar: SignedNumeric {

    /// Returns the additive inverse of the specified value.
    ///
    /// The negation operator (prefix `-`) returns the additive inverse of its
    /// argument.
    ///
    ///     let x = Vector2D(a: 21, b: -30)
    ///     let y = -x
    ///     // y.a == -21
    ///     // y.b == 30
    ///
    /// The resulting value must be representable in the same type as the
    /// argument. In particular, negating a signed, fixed-width integer type's
    /// minimum results in a value that cannot be represented.
    ///
    ///     let z = -Int8.min
    ///     // Overflow error
    ///
    /// - Returns: The additive inverse of this value.
    prefix public static func - (operand: Self) -> Self {
        return .init(a: -operand.a, b: -operand.b, c: -operand.c)
    }

    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value of
    /// an integer `x`:
    ///
    ///     let x = Vector2D(a: 21, b: -30)
    ///     x.negate()
    ///     // x.a == -21
    ///     // x.b == 30
    public mutating func negate() {
        self = -self
    }
}

extension Vector4D where Scalar: SignedNumeric {

    /// Returns the additive inverse of the specified value.
    ///
    /// The negation operator (prefix `-`) returns the additive inverse of its
    /// argument.
    ///
    ///     let x = Vector2D(a: 21, b: -30)
    ///     let y = -x
    ///     // y.a == -21
    ///     // y.b == 30
    ///
    /// The resulting value must be representable in the same type as the
    /// argument. In particular, negating a signed, fixed-width integer type's
    /// minimum results in a value that cannot be represented.
    ///
    ///     let z = -Int8.min
    ///     // Overflow error
    ///
    /// - Returns: The additive inverse of this value.
    prefix public static func - (operand: Self) -> Self {
        return .init(a: -operand.a, b: -operand.b, c: -operand.c, d: -operand.d)
    }

    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value of
    /// an integer `x`:
    ///
    ///     let x = Vector2D(a: 21, b: -30)
    ///     x.negate()
    ///     // x.a == -21
    ///     // x.b == 30
    public mutating func negate() {
        self = -self
    }
}
