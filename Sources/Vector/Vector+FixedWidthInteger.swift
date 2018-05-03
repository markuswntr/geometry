import Foundation

extension Vector2D where Scalar: FixedWidthInteger {

    /// The minimum representable vector in current space.
    public static var min: Self {
        return .init(a: Scalar.min, b: Scalar.min)
    }

    /// The maximum representable vector in current space.
    public static var max: Self {
        return .init(a: Scalar.max, b: Scalar.max)
    }
}

extension Vector3D where Scalar: FixedWidthInteger {

    /// The minimum representable vector in current space.
    public static var min: Self {
        return .init(a: Scalar.min, b: Scalar.min, c: Scalar.min)
    }

    /// The maximum representable vector in current space.
    public static var max: Self {
        return .init(a: Scalar.max, b: Scalar.max, c: Scalar.max)
    }
}

extension Vector4D where Scalar: FixedWidthInteger {

    /// The minimum representable vector in current space.
    public static var min: Self {
        return .init(a: Scalar.min, b: Scalar.min, c: Scalar.min, d: Scalar.min)
    }

    /// The maximum representable vector in current space.
    public static var max: Self {
        return .init(a: Scalar.max, b: Scalar.max, c: Scalar.max, d: Scalar.max)
    }
}
