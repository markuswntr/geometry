import Foundation

/// A vector protocol that basically defines a numeric type within which it is measured.
public protocol Vector where Numeric: Scalar {

    associatedtype Numeric
}

/// Protocol to be implemented by types that are representable by a two dimensional vector.
///
/// A 2D [vector](https://en.wikipedia.org/wiki/Vector_space) is defined by an [ordered pair](https://en.wikipedia.org/wiki/Ordered_pair)
/// of `Scalar` numbers (labeled as `a` and `b`). It can be used to represent a number of things, such as:
///
/// - A point in 2D space (i.e. position, coordinate, ...)
/// - A size in 2D space (where width is represented by `a` and height is represented by `b`
/// - Any arbitrary ordered pair of numbers.
public protocol Vector2D: Vector {

    var a: Numeric { get }

    var b: Numeric { get }

    init(a: Numeric, b: Numeric)
}

// MARK: - Equatable & Comparable

extension Vector2D where Self: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.a == rhs.a && lhs.b == rhs.b
    }
}

extension Vector2D where Self: Comparable, Numeric: Comparable {

    /// Returns a Boolean value indicating whether the `x + y` of the first
    /// point is less than `x + y` of the second point.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.a + lhs.b < rhs.a + rhs.b
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Vector2D where Numeric: ExpressibleByIntegerLiteral {

    /// A vector at the arbitrary point `O` (the origin)
    public static var zero: Self {
        return .init(a: 0, b: 0)
    }
}

extension Vector2D where Self: ExpressibleByIntegerLiteral, Numeric: ExpressibleByIntegerLiteral {

    /// Creates an instance with all coordinates initialized to the specified integer value.
    ///
    /// Do not call this initializer directly. Instead, initialize a variable or
    /// constant using an integer literal. For example:
    ///
    ///     let p: Point2D = 23
    ///
    /// In this example, the assignment to the `p` constant calls this integer
    /// literal initializer behind the scenes.
    ///
    /// - Parameter value: The value to assign to all coordinates.
    public init(integerLiteral value: Numeric) {
        self.init(a: value, b: value)
    }
}

// MARK: - Minimum & Maximum

extension Vector2D where Numeric: FixedWidthInteger {

    /// The minimum representable vector in current space.
    public static var min: Self {
        return .init(a: Numeric.min, b: Numeric.min)
    }

    /// The maximum representable vector in current space.
    public static var max: Self {
        return .init(a: Numeric.max, b: Numeric.max)
    }
}

// MARK: - Signed Numeric

extension Vector2D where Numeric: SignedNumeric {

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

//
///// Vectors are quantities that are fully described by both a magnitude and a direction in its containing space.
//public protocol Vector {
//
//    /// A type that can represent the dimensions of any vector conforming type.
//    associatedtype Space: Dimension
//
//    /// A scalar type that can represent the absolute magnitude of any vector conforming type.
//    associatedtype Magnitude: Scalar
//
//    /// The vector space within it is defined (i.e. 1D, 2D, 3D, ...)
//    var space: Space { get set }
//
//    /// The [euclidean](https://en.wikipedia.org/wiki/Euclidean_vector) length or magnitude of this vector.
//    ///
//    /// For any one dimensional vector `v`, `v.magnitude` is the absolute value of `v`.
//    ///
//    ///     let v = -200
//    ///     // v.magnitude == 200
//    ///
//    /// For any two dimensional vector `v`, `v.magnitude` is the absolute value of `sqrt(p.x * p.x + p.y * p.y)`.
//    ///
//    ///     let p = Point<Int>(x: 3, y: -4)
//    ///     // p.magnitude == 5
//    ///
//    var magnitude: Magnitude { get }
//
//    /// Initializes a new vector of given space and contained coordinate values.
//    init(space: Space)
//}
//
//
//// Adds default operators for vector types that allow additive operations
//extension Vector where Self: Addible, Space: Addible {
//
//    /// Adds `other` to `self`.
//    ///
//    /// - Parameters:
//    ///   - lhs: The left hand side value to which `rhs` should be added
//    ///   - rhs: The right hand side value to add to `self`.
//    public static func += (lhs: inout Self, rhs: Self) {
//        lhs.space += rhs.space
//    }
//
//    /// Returns the sum of `lhs` and `rhs`.
//    ///
//    /// - Parameters:
//    ///   - lhs: The left hand side operant.
//    ///   - rhs: The right hand side operant.
//    /// - Returns: The sum of `lhs` and `rhs`.
//    public static func + (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space + rhs.space)
//    }
//}
//
//// Adds default operators for vector types that are dividable
//extension Vector where Self: Dividable, Space: Dividable {
//
//    // MARK: Divide
//
//    /// Divides the first value by the second and stores the quotient in the
//    /// left-hand-side variable.
//    ///
//    /// For integer types, any remainder of the division is discarded.
//    ///
//    ///     var x = 21
//    ///     x /= 5
//    ///     // x == 4
//    ///
//    /// - Parameters:
//    ///   - lhs: The value to divide.
//    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
//    public static func /= (lhs: inout Self, rhs: Self) {
//        lhs.space /= rhs.space
//    }
//
//    /// Returns the quotient of dividing the first value by the second.
//    ///
//    /// For integer types, any remainder of the division is discarded.
//    ///
//    ///     let x = 21 / 5
//    ///     // x == 4
//    ///
//    /// - Parameters:
//    ///   - lhs: The value to divide.
//    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
//    public static func / (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space / rhs.space)
//    }
//
//    // MARK: Remainder
//
//    /// Divides the first value by the second and stores the remainder in the
//    /// left-hand-side variable.
//    ///
//    /// The result has the same sign as `lhs` and is less than `rhs.magnitude`.
//    ///
//    ///     var x = 22
//    ///     x %= 5
//    ///     // x == 2
//    ///
//    ///     var y = 22
//    ///     y %= -5
//    ///     // y == 2
//    ///
//    ///     var z = -22
//    ///     z %= -5
//    ///     // z == -2
//    ///
//    /// - Parameters:
//    ///   - lhs: The value to divide.
//    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
//    public static func %= (lhs: inout Self, rhs: Self) {
//        lhs.space %= rhs.space
//    }
//
//    /// Returns the remainder of dividing the first value by the second.
//    ///
//    /// The result of the modulo operator (`%`) has the same sign as `lhs` and is
//    /// less than `rhs.magnitude`.
//    ///
//    ///     let x = 22 % 5
//    ///     // x == 2
//    ///     let y = 22 % -5
//    ///     // y == 2
//    ///     let z = -22 % -5
//    ///     // z == -2
//    ///
//    /// For any two integers `a` and `b`, their quotient `q`, and their remainder
//    /// `r`, `a == b * q + r`.
//    ///
//    /// - Parameters:
//    ///   - lhs: The value to divide.
//    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
//    public static func % (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space % rhs.space)
//    }
//}
//
//// Adds default operators for vector types that allow multiplications
//extension Vector where Self: Multipliable, Space: Multipliable {
//
//    /// Multiplies `other` to `self`.
//    ///
//    /// - Parameters:
//    ///   - lhs: The left hand side value to multiply with `rhs`
//    ///   - rhs: The right hand side value to multiply to `self`.
//    public static func *= (lhs: inout Self, rhs: Self) {
//        lhs.space *= rhs.space
//    }
//
//    /// Returns the product of multiplying `lhs` and `rhs`.
//    ///
//    /// - Parameters:
//    ///   - lhs: The left hand side operant.
//    ///   - rhs: The right hand side operant.
//    /// - Returns: The multiplication result of `lhs` and `rhs`.
//    public static func * (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space * rhs.space)
//    }
//}
//
//// Adds default operators for vector types that may overflow
//extension Vector where Self: Overflowable, Space: Overflowable {
//
//    /// Returns the sum of the two given values, discarding any overflow.
//    ///
//    /// The masking addition operator (`&+`) silently discards any overflow that
//    /// occurs during the operation. In the following example, the sum of `100`
//    /// and `121` is greater than the maximum representable `Int8` value, so the
//    /// result is the overflowed value:
//    ///
//    ///     let x: Int8 = 10 &+ 21
//    ///     // x == 31
//    ///     let y: Int8 = 100 &+ 121
//    ///     // y == -35 (after overflow)
//    ///
//    /// - Parameters:
//    ///   - lhs: The first value to add.
//    ///   - rhs: The second value to add.
//    public static func &+ (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space &+ rhs.space)
//    }
//
//    /// Returns the difference of the two given values, discarding any overflow.
//    ///
//    /// The masking subtraction operator (`&-`) silently discards any overflow
//    /// that occurs during the operation. In the following example, the
//    /// difference of `10` and `21` is less than zero, the minimum representable
//    /// `UInt` value, so the result is the overflowed value:
//    ///
//    ///     let x: UInt8 = 21 &- 10
//    ///     // x == 11
//    ///     let y: UInt8 = 10 &- 21
//    ///     // y == 245 (after overflow)
//    ///
//    /// - Parameters:
//    ///   - lhs: A numeric value.
//    ///   - rhs: The value to subtract from `lhs`.
//    public static func &- (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space &- rhs.space)
//    }
//
//    /// Returns the product of the two given values, discarding any overflow.
//    ///
//    /// The masking multiplication operator (`&*`) silently discards any overflow
//    /// that occurs during the operation. In the following example, the product
//    /// of `10` and `50` is greater than the maximum representable `Int8` value,
//    /// so the result is the overflowed value:
//    ///
//    ///     let x: Int8 = 10 &* 5
//    ///     // x == 50
//    ///     let y: Int8 = 10 &* 50
//    ///     // y == -12 (after overflow)
//    ///
//    /// - Parameters:
//    ///   - lhs: The first value to multiply.
//    ///   - rhs: The second value to multiply.
//    public static func &* (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space &* rhs.space)
//    }
//}
//
//// Adds default operators for vector types that allow subtractions
//extension Vector where Self: Subtractable, Space: Subtractable {
//
//    /// Subtracts two values and stores the result in the left-hand-side variable.
//    ///
//    /// - Parameters:
//    ///   - lhs: A numeric value.
//    ///   - rhs: The value to subtract from `lhs`.
//    public static func -= (lhs: inout Self, rhs: Self) {
//        lhs.space -= rhs.space
//    }
//
//    /// Subtracts one value from another and produces their difference.
//    ///
//    /// - Parameters:
//    ///   - lhs: A numeric value.
//    ///   - rhs: The value to subtract from `lhs`.
//    public static func - (lhs: Self, rhs: Self) -> Self {
//        return .init(space: lhs.space - rhs.space)
//    }
//}
