import Foundation

// MARK: Point

/// Since 2D points are the most common use cases, it gets the `Point` alias
public typealias Point = Point2D

// MARK: - 2D

/// A structure that defines a point in a two-dimensional coordinate system.
public struct Point2D<Numeric>: Vector, Equatable where Numeric: Scalar & DoubleConvertible {

    /// The vector space within it is defined => 2D
    public var space = Space2D<Numeric>(unified: 0)

    public var magnitude: Double {
        return sqrt(pow(x.double, 2) + pow(y.double, 2))
    }

    /// The `x` value of the point.
    public var x: Numeric {
        // In second ordered space
        set { space.next.coordinate = newValue }
        get { return space.next.coordinate }
    }

    /// The `y` value of the point.
    public var y: Numeric {
        // In first ordered space
        set { space.coordinate = newValue }
        get { return space.coordinate }
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    public init(x: Numeric, y: Numeric) {
        self.x = x
        self.y = y
    }
}

// MARK: Comparisons

extension Point2D: Comparable where Numeric: Comparable {

    /// Returns a Boolean value indicating whether the `x + y` of the first
    /// point is less than `x + y` of the second point.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: Point2D, rhs: Point2D) -> Bool {
        return lhs.x + lhs.y < rhs.x + rhs.y
    }
}

// MARK: Arithmetic

extension Point2D: Addible, Dividable, Multipliable, Subtractable {
    // Uses the vector provided default implementations
}

extension Point2D: Overflowable where Numeric: FixedWidthInteger {
    // Uses the vector provided default implementations
}

let point1 = Point(x: 2, y: 3)
let point2 = Point(x: 3, y: 2)

var point3 = point1 + point2
var point4 = point1 - point2
var point5 = point1 % point2
var point6 = point1 / point2
var point7 = point1 &+ point2
var point8 = point1 &- point2
var point9 = point1 &* point2

// MARK: - 3 Dimensional

public struct Point3D<Numeric>: Vector where Numeric: Scalar & DoubleConvertible {

    /// The vector space within it is defined => 3D
    public var space = Space3D<Numeric>(unified: 0)

    public var magnitude: Double {
        return sqrt(pow(x.double, 2) + pow(y.double, 2) + pow(z.double, 2))
    }

    /// The `x` value of the point.
    public var x: Numeric {
        // In third ordered space
        set { space.next.next.coordinate = newValue }
        get { return space.next.next.coordinate }
    }

    /// The `y` value of the point.
    public var y: Numeric {
        // In second ordered space
        set { space.next.coordinate = newValue }
        get { return space.next.coordinate }
    }

    /// The `z` value of the point.
    public var z: Numeric {
        // In first ordered space
        set { space.coordinate = newValue }
        get { return space.coordinate }
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    ///   - z: The `z` value of the point.
    public init(x: Numeric, y: Numeric, z: Numeric) {
        self.x = x
        self.y = y
        self.z = z
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
    ///     // Prints "Point2D<Int>(x: 21, y: 30)"
    /// ```
    public var debugDescription: String {
        return "Point2D<\(String(describing: Numeric.self))>(x: \(String(describing: x)), y: \(String(describing: y)))"
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
