import Foundation

/// A structure that defines a point in a 3-dimensional space.
public struct Point3D<Coordinate>: Vector3D, Equatable, Comparable where Coordinate: Numeric & Comparable {

    public typealias Scalar = Coordinate

    public var a: Coordinate

    public var b: Coordinate

    public var c: Coordinate

    public init(a: Coordinate, b: Coordinate, c: Coordinate) {
        self.a = a
        self.b = b
        self.c = c
    }
}

extension Point3D {

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

    /// The `z` value of the point.
    ///
    /// It masks the value of `c`, as it is a more common coordinate description.
    public var z: Coordinate {
        set { c = newValue }
        get { return c }
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    ///   - z: The `z` value of the point.
    public init(x: Coordinate, y: Coordinate, z: Coordinate) {
        self.init(a: x, b: y, c: z)
    }
}

// MARK: String Convertible

extension Point3D: CustomStringConvertible where Scalar: CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 21, y: 30, z: 12)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(x: 21, y: 30, z: 12)"
    /// ```
    public var description: String {
        let x = String(describing: a)
        let y = String(describing: b)
        let z = String(describing: c)
        return "(x: \(x), y: \(y), z: \(z))"
    }
}

extension Point3D: CustomDebugStringConvertible where Scalar: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Point(x: 21, y: 30, z: 12)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "Point2D<Int>(x: 21, y: 30, z: 12)"
    /// ```
    public var debugDescription: String {
        let type = String(reflecting: Scalar.self)
        let x = String(reflecting: a)
        let y = String(reflecting: b)
        let z = String(reflecting: c)
        return "Point2D<\(type)>(x: \(x), y: \(y), z: \(z))"
    }
}
