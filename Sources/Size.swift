import Foundation

// MARK: - 2D

/// Since 2D sizes are the most common use cases, it gets the `Size` alias
public typealias Size = Size2D

/// A structure that defines a size in a two-dimensional space.
public struct Size2D<Length>: Vector2D where Length: Numeric {

    public typealias Scalar = Length

    public var a: Length

    public var b: Length

    public init(a: Length, b: Length) {
        self.a = a
        self.b = b
    }
}

extension Size2D {

    /// The `width` value of the size.
    ///
    /// It masks the value of `a`, as it is a more common as length description.
    public var width: Length {
        set { a = newValue }
        get { return a }
    }

    /// The `height` value of the size.
    ///
    /// It masks the value of `a`, as it is a more common as length description.
    public var height: Length {
        set { b = newValue }
        get { return b }
    }

    /// Initializes a new size of given width and height.
    ///
    /// - Parameters:
    ///   - width: The `width` value of the size.
    ///   - height: The `height` value of the size.
    public init(width: Length, height: Length) {
        self.init(a: width, b: height)
    }
}

// MARK: String Convertible

extension Size2D: CustomStringConvertible where Scalar: CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Size(width: 21, height: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(width: 21, height: 30)"
    /// ```
    public var description: String {
        return "(width: \(String(describing: width)), height: \(String(describing: height)))"
    }
}

extension Size2D: CustomDebugStringConvertible where Scalar: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer.
    ///
    /// Example:
    /// ```
    ///     var p = Size(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "Point2D<Int>(x: 21, y: 30)"
    /// ```
    public var debugDescription: String {
        return "Size2D<\(String(describing: Scalar.self))>(width: \(String(describing: width)), height: \(String(describing: height)))"
    }
}
