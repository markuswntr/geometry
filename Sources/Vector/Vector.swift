import Foundation

/// A vector protocol that basically defines a scalar/numeric type within which it is described.
public protocol Vector where Scalar: Numeric {

    /// [Scalars](https://en.wikipedia.org/wiki/Scalar_(mathematics)) are quantities that are
    /// fully described by a magnitude (or in the swift universe, by a `Numeric` value) alone.
    associatedtype Scalar
}

// MARK: - 2D

/// Protocol to be implemented by types that are representable by a two dimensional vector.
///
/// A 2D [vector](https://en.wikipedia.org/wiki/Vector_space) is defined by an [ordered pair](https://en.wikipedia.org/wiki/Ordered_pair)
/// of `Scalar` numbers (labeled as `a` and `b`). It can be used to represent a number of things, such as:
///
/// - A point in 2D space (i.e. position, coordinate, ...)
/// - A size in 2D space (where width is represented by `a` and height is represented by `b`
/// - Any arbitrary ordered pair of numbers.
public protocol Vector2D: Vector {

    /// The first ordered value of the vector.
    var a: Scalar { get }

    /// The second ordered value of the vector.
    var b: Scalar { get }

    /// Initializes a new instance of `Self`, using given paramaters.
    ///
    /// - Parameters:
    ///   - a: The first ordered value of the vector.
    ///   - a: The second ordered value of the vector.
    init(a: Scalar, b: Scalar)
}

// MARK: - 3D

public protocol Vector3D: Vector2D {

    var c: Scalar { get }

    init(a: Scalar, b: Scalar, c: Scalar)
}

extension Vector3D {

    public init<Vector: Vector2D>(vector: Vector, c: Scalar) where Vector.Scalar == Self.Scalar {
        self.init(a: vector.a, b: vector.b, c: c)
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
