import Foundation

/// A structure that defines a point in a two-dimensional coordinate system.
public struct Point<Numeric: Swift.Numeric> {

    /// The x-coordinate of the point.
    public var x: Numeric

    /// The y-coordinate of the point.
    public var y: Numeric

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

// MARK: Zero

extension Point {

    /// The point at the an arbitrary point `O` (the origin)
    public static var zero: Point {
        return .init(x: 0, y: 0)
    }
}

// MARK: Equatable

extension Point: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
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

// MARK: Arithmetic

extension Point: Arithmetic {

    /// Adds two points and produces their sum.
    ///
    /// Example:
    /// ```
    /// let p1 = Point(x: 1, y: 2)
    /// let p2 = Point(x: 1, y: 2)
    /// let p3 = p1 + p2
    /// /// p3.x == 2
    /// /// p3.y == 4
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func + (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func += (lhs: inout Point, rhs: Point) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }

    /// Subtracts one value from another and produces their difference.
    ///
    /// Example:
    /// ```
    /// let p1 = Point(x: 2, y: 4)
    /// let p2 = Point(x: 0, y: 3)
    /// let p3 = p1 - p2
    /// /// p3.x == 2
    /// /// p3.y == 1
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func - (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    /// Subtracts two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func -= (lhs: inout Point, rhs: Point) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }

    /// Multiplies two values and produces their product.
    ///
    /// Example:
    /// ```
    /// let p1 = Point(x: 2, y: 4)
    /// let p2 = Point(x: 1, y: 2)
    /// let p3 = p1 * p2
    /// /// p3.x == 2
    /// /// p3.y == 8
    /// ```
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func * (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }

    /// Multiplies two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func *= (lhs: inout Point, rhs: Point) {
        lhs.x *= rhs.x
        lhs.y *= rhs.y
    }
}

// MARK: Signed

extension Point: Signed where Numeric: SignedNumeric {

    /// Returns the given point unchanged.
    ///
    /// - Returns: The given point without any changes.
    public prefix static func + (operand: Point) -> Point {
        return Point(x: +operand.x, y: +operand.y)
    }

    /// Returns the additive inverse of the specified value.
    ///
    /// - Returns: The additive inverse of this value.
    public prefix static func - (operand: Point) -> Point {
        return Point(x: -operand.x, y: -operand.y)
    }

    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value
    public mutating func negate() {
        x.negate()
        y.negate()
    }
}
