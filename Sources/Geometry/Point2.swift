import Vector

public struct Point2<Scalar>: Vector2, ExpressibleByArrayLiteral where Scalar: Numeric & RawVectorizable2 {

    /// The underlying optimized vector
    public var _vector: Scalar.RawVector2

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    public init(vector: Scalar.RawVector2) {
        _vector = vector
    }
}

// MARK: Property Extension

extension Point2 {

    /// The `x` value of the point.
    ///
    /// It masks the value at `index0`.
    public var x: Scalar {
        set { _vector[.index0] = newValue }
        get { return _vector[.index0] }
    }

    /// The `y` value of the point.
    ///
    /// It masks the value at `index1`.
    public var y: Scalar {
        set { _vector[.index1] = newValue }
        get { return _vector[.index1] }
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    public init(x: Scalar, y: Scalar) {
        self.init(sequence: [x, y])
    }
}

// MARK: String Convertible

extension Point2: CustomStringConvertible where Scalar: CustomStringConvertible {

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
        let x = String(describing: self.x)
        let y = String(describing: self.y)
        return "(x: \(x), y: \(y))"
    }
}

extension Point2: CustomDebugStringConvertible where Scalar: CustomDebugStringConvertible {

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
        let x = String(describing: self.x)
        let y = String(describing: self.y)
        return "Point2D<\(type)>(x: \(x), y: \(y))"
    }
}

// MARK: - Arithmetics

extension Point2: Equatable where Vector: Equatable {}
