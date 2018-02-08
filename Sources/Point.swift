import Foundation

/// A structure that defines a point in a two-dimensional coordinate system.
public struct Point<Numeric: Swift.Numeric>: Equatable {

    /// The x-coordinate of the point.
    public var x: Numeric

    /// The y-coordinate of the point.
    public var y: Numeric

    /// The point at the arbitrary point `O` (the origin)
    public static var zero: Point {
        return .init(x: 0, y: 0)
    }

    /// Initializes a new point at given coordinates.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    public init(x: Numeric, y: Numeric) {
        self.x = x
        self.y = y
    }
}

// MARK: Comparable

extension Point: Comparable where Numeric: Comparable {

    /// Returns a Boolean value indicating whether the `x + y` of the first
    /// point is less than `x + y` of the second point.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: Point, rhs: Point) -> Bool {
        return lhs.x + lhs.y < rhs.x + rhs.y
    }
}

// MARK: String Convertible

extension Point: CustomStringConvertible where Numeric: CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(x: 21, y: 30)"
    /// ```
    public var description: String {
        return "(x: \(String(describing: x)), y: \(String(describing: y)))"
    }
}

extension Point: CustomDebugStringConvertible where Numeric: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "Point<Int>(x: 21, y: 30)"
    /// ```
    public var debugDescription: String {
        return "Point<\(String(describing: Numeric.self))>(x: \(String(describing: x)), y: \(String(describing: y)))"
    }
}

// MARK: - Arithmetic

extension Point: BasicArithmetic {

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 1, y: 2)
    ///     p += Point(x: 1, y: 2)
    ///     // p.x == 2
    ///     // p.y == 4
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func += (lhs: inout Point, rhs: Point) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }

    /// Subtracts two values and stores the result in the left-hand-side variable.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 2, y: 4)
    ///     p -= Point(x: 0, y: 3)
    ///     // p.x == 2
    ///     // p.y == 1
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -= (lhs: inout Point, rhs: Point) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }

    /// Multiplies two values and stores the result in the left-hand-side variable.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 2, y: 4)
    ///     p *= Point(x: 1, y: 2)
    ///     // p.x == 2
    ///     // p.y == 8
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func *= (lhs: inout Point, rhs: Point) {
        lhs.x *= rhs.x
        lhs.y *= rhs.y
    }
}

// MARK: Extended
// TODO: Adjust examples in comments
extension Point: ExtendedArithmetic where Numeric: BinaryInteger {

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
    public static func /= (lhs: inout Point, rhs: Point) {
        lhs.x /= rhs.x
        lhs.y /= rhs.y
    }

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
    public static func %= (lhs: inout Point, rhs: Point) {
        lhs.x %= rhs.x
        lhs.y %= rhs.y
    }
}

extension Point where Numeric: BinaryFloatingPoint {

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
    public static func /= (lhs: inout Point, rhs: Point) {
        lhs.x /= rhs.x
        lhs.y /= rhs.y
    }

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
    public static func %= (lhs: inout Point, rhs: Point) {
        lhs.x.formTruncatingRemainder(dividingBy: rhs.x)
        lhs.y.formTruncatingRemainder(dividingBy: rhs.y)
    }
}

// MARK: Overflow

extension Point: OverflowArithmethic where Numeric: FixedWidthInteger {

    /// Returns the sum of the two given values, discarding any overflow.
    ///
    /// The masking addition operator (`&+`) silently discards any overflow that
    /// occurs during the operation.
    ///
    /// Example:
    /// ```
    ///     let a = Point<Int8>(x: 5, y: 1) &+ Point<Int8>(x: 10, y: 3)
    ///     // a.x == 15; a.y == 4
    ///     let b = Point<Int8>(x: 20, y: 100) &+ Point<Int8>(x: 64, y: 121)
    ///     // b.x == 84; b.y == -35 (after overflow)
    /// ```
    ///
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func &+ (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x &+ rhs.x, y: lhs.y &+ rhs.y)
    }

    /// Returns the difference of the two given values, discarding any overflow.
    ///
    /// The masking subtraction operator (`&-`) silently discards any overflow
    /// that occurs during the operation.
    ///
    /// Example:
    /// ```
    ///     let a = Point<UInt8>(x: 21, y: 10) &- Point<UInt8>(x: 10, y: 2)
    ///     // a.x == 11; a.y == 8
    ///     let b = Point<UInt8>(x: 10, y: 10) &- Point<UInt8>(x: 2, y: 21)
    ///     // b.x == 8; b.y == 245 (after overflow)
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func &- (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x &- rhs.x, y: lhs.y &- rhs.y)
    }

    /// Returns the product of the two given values, discarding any overflow.
    ///
    /// The masking multiplication operator (`&*`) silently discards any overflow
    /// that occurs during the operation.
    ///
    /// Example:
    /// ```
    ///     let a = Point<Int8>(x: 2, y: 4) &* Point<Int8>(x: 3, y: 5)
    ///     // a.x == 6; a.y == 20
    ///     let b = Point<Int8>(x: 2, y: 10) &* Point<Int8>(x: 3, y: 50)
    ///     // b.x == 6; b.y == -12 (after overflow)
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func &* (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x &* rhs.x, y: lhs.y &* rhs.y)
    }
}

// MARK: Signed

extension Point: SignedArithmetic where Numeric: SignedNumeric {

    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value
    public mutating func negate() {
        x.negate()
        y.negate()
    }
}

// MARK: - Casts

extension Point where Numeric: FixedWidthInteger { // TODO: Make it less of a pain with runtime errors

    /// Creates an integer from the given floating-point value, if it can be
    /// represented exactly.
    ///
    /// If the value passed as `source` is not representable exactly, the result
    /// is `nil`. In the following example, the constant `x` is successfully
    /// created from a value of `21.0`, while the attempt to initialize the
    /// constant `y` from `21.5` fails:
    ///
    ///     let x = Int(exactly: 21.0)
    ///     // x == Optional(21)
    ///     let y = Int(exactly: 21.5)
    ///     // y == nil
    ///
    /// - Parameter source: A floating-point value to convert to an integer.
    public init<T>(exactly source: Point<T>) throws where T: BinaryFloatingPoint {
        guard let x = Numeric(exactly: source.x), let y = Numeric(exactly: source.y) else { throw Error.notRepresentable }
        self.init(x: x, y: y)
    }

    /// Creates an integer from the given floating-point value, rounding toward zero.
    ///
    /// Any fractional part of the value passed as `source` is removed, rounding
    /// the value toward zero.
    ///
    ///     let x = Int(21.5)
    ///     // x == 21
    ///     let y = Int(-21.5)
    ///     // y == -21
    ///
    /// If `source` is outside the bounds of this type after rounding toward
    /// zero, a runtime error may occur.
    ///
    ///     let z = UInt(-21.5)
    ///     // Error: ...the result would be less than UInt.min
    ///
    /// - Parameter source: A floating-point value to convert to an integer.
    ///   `source` must be representable in this type after rounding toward
    ///   zero.
    public init<T>(_ source: Point<T>) where T: BinaryFloatingPoint {
        self.init(x: Numeric(source.x), y: Numeric(source.y))
    }

    /// Creates a new instance with the representable value that's closest to the
    /// given integer.
    ///
    /// If the value passed as `source` is greater than the maximum representable
    /// value in this type, the result is the type's `max` value. If `source` is
    /// less than the smallest representable value in this type, the result is
    /// the type's `min` value.
    ///
    /// In this example, `x` is initialized as an `Int8` instance by clamping
    /// `500` to the range `-128...127`, and `y` is initialized as a `UInt`
    /// instance by clamping `-500` to the range `0...UInt.max`.
    ///
    ///     let x = Int8(clamping: 500)
    ///     // x == 127
    ///     // x == Int8.max
    ///
    ///     let y = UInt(clamping: -500)
    ///     // y == 0
    ///
    /// - Parameter source: An integer to convert to this type.
    public init<T>(clamping source: Point<T>) where T: BinaryInteger {
        self.init(x: Numeric(clamping: source.x), y: Numeric(clamping: source.y))
    }

    /// Creates an integer from the given floating-point value, rounding toward zero.
    ///
    /// Any fractional part of the value passed as `source` is removed, rounding
    /// the value toward zero.
    ///
    ///     let x = Int(21.5)
    ///     // x == 21
    ///     let y = Int(-21.5)
    ///     // y == -21
    ///
    /// If `source` is outside the bounds of this type after rounding toward
    /// zero, a runtime error may occur.
    ///
    ///     let z = UInt(-21.5)
    ///     // Error: ...the result would be less than UInt.min
    ///
    /// - Parameter source: A floating-point value to convert to an integer.
    ///   `source` must be representable in this type after rounding toward
    ///   zero.
    public init<T>(_ source: Point<T>) where T: BinaryInteger {
        self.init(x: Numeric(source.x), y: Numeric(source.y))
    }
}
