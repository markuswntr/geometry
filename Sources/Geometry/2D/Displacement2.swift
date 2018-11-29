import Vector
import Foundation

/// [Displacement](https://physics.info/displacement/) is a vector measure of the
/// interval between two locations measured along the shortest path connecting them.
public struct Displacement2<Scalar>: Vector2 where Scalar: Numeric & RawVectorizable2, Scalar.RawVector2: Equatable {

    /// The collection Index/Indices to access values of `Self`
    public typealias Index = VectorIndex2

    /// `Displacement2` is defined by `Scalar` values, that are `Element`s of the collection
    public typealias Element = Scalar

    /// The underlying vector type
    public typealias Vector = Element.RawVector2

    /// The underlying simd vector.
    ///
    /// Must not be used directly. Exposed for performance reasons only.
    /// Use the delta properties to access the coordinates.
    public var _vector: Vector

    /// The delta value of the `x` or `horizontal` axis
    public var deltaX: Scalar {
        /// Masks the vector value at `index0`.
        @_transparent set { self[.index0] = newValue }
        @_transparent get { return self[.index0] }
    }

    /// The delta value of the `y` or `vertical` axis
    public var deltaY: Scalar {
        /// Masks the vector value at `index1`.
        @_transparent set { self[.index1] = newValue }
        @_transparent get { return self[.index1] }
    }

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }

    /// Initializes a new point at given position.
    ///
    /// - Parameters:
    ///   - x: The `x` value of the point.
    ///   - y: The `y` value of the point.
    @_transparent public init(x: Scalar, y: Scalar) {
        self.init(index0: x, index1: y)
    }
}

// MARK: String Convertible

extension Displacement2: CustomStringConvertible where Scalar: CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var v = Displacement2<Float>(width: 21, height: 30)
    ///     let s = String(describing: v)
    ///     print(s)
    ///     // Prints "(width: 21, height: 30)"
    /// ```
    public var description: String {
        let deltaX = String(describing: self.deltaX)
        let deltaY = String(describing: self.deltaY)
        return "(deltaX: \(deltaX), deltaY: \(deltaY))"
    }
}

extension Displacement2: CustomDebugStringConvertible where Scalar: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Displacement2<Float>(deltaX: 21, deltaY: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "Displacement2<Float>(deltaX: 21, deltaY: 30)"
    /// ```
    public var debugDescription: String {
        let type = String(describing: Scalar.self)
        let deltaX = String(describing: self.deltaX)
        let deltaY = String(describing: self.deltaY)
        return "Size2<\(type)>(deltaX: \(deltaX), deltaY: \(deltaY))"
    }
}
