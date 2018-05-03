import Foundation

extension Vector2D where Scalar: ExpressibleByIntegerLiteral {

    /// A vector at the arbitrary point `O` (the origin)
    public static var zero: Self {
        return .init(a: 0, b: 0)
    }
}

extension Vector3D where Scalar: ExpressibleByIntegerLiteral {

    public init(a: Scalar, b: Scalar) {
        self.init(a: a, b: b, c: 0)
    }
}

// MARK: VectorXD ExpressibleByIntegerLiteral Conformance

extension Vector2D where Self: ExpressibleByIntegerLiteral, Scalar: ExpressibleByIntegerLiteral {

    /// Creates an instance with all coordinates initialized to the specified integer value.
    ///
    /// Do not call this initializer directly. Instead, initialize a variable or
    /// constant using an integer literal. For example:
    ///
    ///     let p: Point2D = 23
    ///
    /// In this example, the assignment to the `p` constant calls this integer
    /// literal initializer behind the scenes.
    ///
    /// - Parameter value: The value to assign to all coordinates.
    public init(integerLiteral value: Scalar) {
        self.init(a: value, b: value)
    }
}
