import Foundation

/// A structure that defines a point in a two-dimensional space.
public struct Point2D<Coordinate>: Vector2D, Equatable, Comparable where Coordinate: Numeric & Comparable {

    public typealias Scalar = Coordinate

    public var a: Coordinate

    public var b: Coordinate

    public init(a: Coordinate, b: Coordinate) {
        self.a = a
        self.b = b
    }
}

extension Point2D {

    /// The `x` value of the point.
    ///
    /// It masks the value of `a`, as it is a more common coordinate description.
    public var x: Coordinate {
        set { a = newValue }
        get { return a }
    }

    /// The `y` value of the point.
    ///
    /// It masks the value of `b`, as it is a more common coordinate description.
    public var y: Coordinate {
        set { b = newValue }
        get { return b }
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    public init(x: Coordinate, y: Coordinate) {
        self.init(a: x, b: y)
    }
}

// MARK: String Convertible

extension Point2D: CustomStringConvertible where Scalar: CustomStringConvertible {

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
        let x = String(describing: a)
        let y = String(describing: b)
        return "(x: \(x), y: \(y))"
    }
}

extension Point2D: CustomDebugStringConvertible where Scalar: CustomDebugStringConvertible {

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
        let type = String(describing: Scalar.self)
        let x = String(describing: a)
        let y = String(describing: b)
        return "Point2D<\(type)>(x: \(x), y: \(y))"
    }
}
