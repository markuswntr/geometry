import Vector
import Foundation

/// A structure that defines a size in a two-dimensional space.
public struct Size2<Length>: Vector2 where Length: Numeric & RawVectorizable2, Length.RawVector2: Equatable {

    /// The collection Index/Indices to access values of `Self`
    public typealias Index = VectorIndex2

    /// `Size` is defined by `Length` values, that are `Element`s of the collection
    public typealias Element = Length

    /// The underlying vector type
    public typealias Vector = Element.RawVector2

    /// The underlying simd vector.
    ///
    /// Must not be used directly. Exposed for performance reasons only.
    /// Use the `width` and `heigth` properties to access the coordinates.
    public var _vector: Vector

    /// The length of the side identified as `width`.
    public var width: Length {
        /// Masks the vector value at `index0`.
        @_transparent set { self[.index0] = newValue }
        @_transparent get { return self[.index0] }
    }

    /// The length of the side identified as `height`.
    public var height: Length {
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
    ///   - x: The `width` value of the size.
    ///   - y: The `height` value of the size.
    @_transparent public init(width: Length, height: Length) {
        self.init(index0: width, index1: height)
    }
}

// MARK: String Convertible

extension Size2: CustomStringConvertible where Length: CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var v = Size2<Float>(width: 21, height: 30)
    ///     let s = String(describing: v)
    ///     print(s)
    ///     // Prints "(width: 21, height: 30)"
    /// ```
    public var description: String {
        let width = String(describing: self.width)
        let height = String(describing: self.height)
        return "(width: \(width), height: \(height))"
    }
}

extension Size2: CustomDebugStringConvertible where Length: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Size2<Float>(width: 21, height: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "Size2<Float>(width: 21, height: 30)"
    /// ```
    public var debugDescription: String {
        let type = String(describing: Length.self)
        let width = String(describing: self.width)
        let height = String(describing: self.height)
        return "Size2<\(type)>(width: \(width), height: \(height))"
    }
}

// MARK: - Equatable & Comparable

extension Size2: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @_transparent public static func == (lhs: Size2, rhs: Size2) -> Bool {
        return lhs._vector == rhs._vector
    }
}

// MARK: - Arithmetic

extension Size2 where Length.RawVector2: AdditiveArithmetic {

    /// Increases the size by adding (elementwise) `rhs` to `lhs`.
    @_transparent public static func + (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector + rhs._vector)
    }

    /// Decreases the size by subtracting (elementwise) `rhs` from `lhs`.
    @_transparent public static func - (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector - rhs._vector)
    }

    /// Increases the size inline by adding (elementwise) `rhs` to `lhs`.
    @_transparent public static func += (lhs: inout Size2, rhs: Displacement2<Length>) {
        lhs._vector += rhs._vector
    }

    /// Decreases the size inline by subtracting (elementwise) `rhs` from `lhs`.
    @_transparent public static func -= (lhs: inout Size2, rhs: Displacement2<Length>) {
        lhs._vector -= rhs._vector
    }
}

extension Size2 where Length.RawVector2: AdditiveOverflowArithmetic {

    /// Increases the size by adding (elementwise) `rhs` to `lhs`.
    @_transparent public static func &+ (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector &+ rhs._vector)
    }

    /// Decreases the size by subtracting (elementwise) `rhs` from `lhs`.
    @_transparent public static func &- (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector &- rhs._vector)
    }
}

extension Size2 where Length.RawVector2: MultiplicativeArithmetic, Length == Length.RawVector2.Scalar {

    /// Increases the size by multiplying (elementwise) `rhs` to `lhs`.
    @_transparent public static func * (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector * rhs._vector)
    }

    /// Scaled size by `rhs`
    @_transparent public static func * (lhs: Size2, rhs: Length) -> Size2 {
        return .init(vector: lhs._vector  * rhs)
    }

    /// Scaled size by `rhs`
    @_transparent public static func / (lhs: Size2, rhs: Length) -> Size2 {
        return .init(vector: lhs._vector / rhs)
    }

    /// Increases the size by multiplying (elementwise) `rhs`.
    @_transparent public static func *= (lhs: inout Size2, rhs: Displacement2<Length>) {
        lhs._vector *= rhs._vector
    }

    /// Increases the size by dividing (elementwise) `rhs`.
    @_transparent public static func /= (lhs: inout Size2, rhs: Displacement2<Length>) {
        lhs._vector /= rhs._vector
    }

    /// Scales `lhs` by `rhs`.
    @_transparent public static func *= (lhs: inout Size2, rhs: Length) {
        lhs._vector *= rhs
    }

    /// Scales `lhs` by `1/rhs`.
    @_transparent public static func /= (lhs: inout Size2, rhs: Length) {
        lhs._vector /= rhs
    }
}

extension Size2 where Length.RawVector2: MultiplicativeOverflowArithmetic, Length == Length.RawVector2.Scalar {

    /// Increases the size by multiplying (elementwise) `rhs` to `lhs`.
    @_transparent public static func &* (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector &* rhs._vector)
    }

    /// Scaled size by `rhs`
    @_transparent public static func &* (lhs: Size2, rhs: Length) -> Size2 {
        return .init(vector: lhs._vector &* rhs)
    }

    /// Scaled size by `rhs`
    @_transparent public static func / (lhs: Size2, rhs: Displacement2<Length>) -> Size2 {
        return .init(vector: lhs._vector / rhs._vector)
    }

    /// Scaled size by `rhs`
    @_transparent public static func / (lhs: Size2, rhs: Length) -> Size2 {
        return .init(vector: lhs._vector / rhs)
    }

    /// Increases the size by dividing (elementwise) `rhs`.
    @_transparent public static func /= (lhs: inout Size2, rhs: Displacement2<Length>) {
        lhs._vector /= rhs._vector
    }
}

