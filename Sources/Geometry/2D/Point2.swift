import Vector

/// A structure that defines a point in a two-dimensional space.
public struct Point2<Coordinate> where Coordinate: Numeric & RawVectorizable2, Coordinate.RawVector2: Equatable {

    /// The underlying vector, that stores the coordinates and is masked by the point
    public private(set) var _vector: Vector2<Coordinate>

    /// The `x` coordinate of the point.
    public var x: Coordinate {
        /// Masks the vector value at `index0`.
        @_transparent set { _vector[.index0] = newValue }
        @_transparent get { return _vector[.index0] }
    }

    /// The `y` coordinate of the point.
    public var y: Coordinate {
        /// Masks the vector value at `index1`.
        @_transparent set { _vector[.index1] = newValue }
        @_transparent get { return _vector[.index1] }
    }

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector2<Coordinate>) {
        _vector = vector
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    @_transparent public init(x: Coordinate, y: Coordinate) {
        self.init(vector: Vector2<Coordinate>(index0: x, index1: y))
    }
}

// MARK: String Convertible

extension Point2: CustomStringConvertible where Coordinate: CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Point2(x: 21, y: 30)
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

extension Point2: CustomDebugStringConvertible where Coordinate: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Point2<Float>(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "Point2<Float>(x: 21, y: 30)"
    /// ```
    public var debugDescription: String {
        let type = String(describing: Coordinate.self)
        let x = String(describing: self.x)
        let y = String(describing: self.y)
        return "Point2<\(type)>(x: \(x), y: \(y))"
    }
}

// MARK: - Equatable & Comparable

extension Point2: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @_transparent public static func == (lhs: Point2, rhs: Point2) -> Bool {
        return lhs._vector == rhs._vector
    }
}

extension Point2: Comparable where Coordinate.RawVector2: Comparable {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @_transparent public static func < (lhs: Point2, rhs: Point2) -> Bool {
        return lhs._vector < rhs._vector
    }
}

// MARK: - Arithmetic

extension Point2 where Coordinate.RawVector2: AdditiveArithmetic {

    /// Negation of `rhs`.
    @_transparent public prefix static func - (rhs: Point2) -> Point2 {
        return .init(vector: -rhs._vector)
    }

    /// Moves the point by adding (elementwise) `rhs` to `lhs`.
    @_transparent public static func + (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector + rhs)
    }

    /// Moves the point by subtracting (elementwise) `rhs` from `lhs`.
    @_transparent public static func - (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector - rhs)
    }

    /// Moves the point inline by adding (elementwise) `rhs` to `lhs`.
    @_transparent public static func += (lhs: inout Point2, rhs: Vector2<Coordinate>) {
        lhs._vector += rhs
    }

    /// Moves the point inline by subtracting (elementwise) `rhs` from `lhs`.
    @_transparent public static func -= (lhs: inout Point2, rhs: Vector2<Coordinate>) {
        lhs._vector -= rhs
    }
}

extension Point2 where Coordinate.RawVector2: AdditiveOverflowArithmetic {

    /// Negation of `rhs`.
    @_transparent public prefix static func - (rhs: Point2) -> Point2 {
        return .init(vector: -rhs._vector)
    }

    /// Moves the point by adding (elementwise) `rhs` to `lhs`.
    @_transparent public static func &+ (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector &+ rhs)
    }

    /// Moves the point by subtracting (elementwise) `rhs` from `lhs`.
    @_transparent public static func &- (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector &- rhs)
    }
}

extension Point2 where Coordinate.RawVector2: MultiplicativeArithmetic, Coordinate == Coordinate.RawVector2.Scalar {

    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
    @_transparent public static func * (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector * rhs)
    }

    /// Scalar-Vector product.
    @_transparent public static func * (lhs: Point2, rhs: Coordinate) -> Point2 {
        return .init(vector: lhs._vector  * rhs)
    }

    /// Elementwise quotient of `lhs` and `rhs`.
    @_transparent public static func / (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector / rhs)
    }

    /// Divide vector by scalar.
    @_transparent public static func / (lhs: Point2, rhs: Coordinate) -> Point2 {
        return .init(vector: lhs._vector / rhs)
    }

    /// Multiply `lhs` by `rhs` (elementwise).
    @_transparent public static func *= (lhs: inout Point2, rhs: Vector2<Coordinate>) {
        lhs._vector *= rhs
    }

    /// Divide `lhs` by `rhs` (elementwise).
    @_transparent public static func /= (lhs: inout Point2, rhs: Vector2<Coordinate>) {
        lhs._vector /= rhs
    }

    /// Scales `lhs` by `rhs`.
    @_transparent public static func *= (lhs: inout Point2, rhs: Coordinate) {
        lhs._vector *= rhs
    }

    /// Scales `lhs` by `1/rhs`.
    @_transparent public static func /= (lhs: inout Point2, rhs: Coordinate) {
        lhs._vector /= rhs
    }
}

extension Point2 where Coordinate.RawVector2: MultiplicativeOverflowArithmetic, Coordinate == Coordinate.RawVector2.Scalar {

    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
    @_transparent public static func &* (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector &* rhs)
    }

    /// Scalar-Vector product.
    @_transparent public static func &* (lhs: Point2, rhs: Coordinate) -> Point2 {
        return .init(vector: lhs._vector &* rhs)
    }

    /// Elementwise quotient of `lhs` and `rhs`.
    @_transparent public static func / (lhs: Point2, rhs: Vector2<Coordinate>) -> Point2 {
        return .init(vector: lhs._vector / rhs)
    }

    /// Divide vector by scalar.
    @_transparent public static func / (lhs: Point2, rhs: Coordinate) -> Point2 {
        return .init(vector: lhs._vector / rhs)
    }

    /// Divide `lhs` by `rhs` (elementwise).
    @_transparent public static func /= (lhs: inout Point2, rhs: Vector2<Coordinate>) {
        lhs._vector /= rhs
    }
}
