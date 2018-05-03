import Foundation

extension Vector2D where Self: Comparable, Scalar: Comparable {

    /// Returns a Boolean value indicating whether the length of the first vector is smaller than the second.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.a + lhs.b < rhs.a + rhs.b
    }
}

extension Vector3D where Self: Comparable, Scalar: Comparable {

    /// Returns a Boolean value indicating whether the length of the first vector is smaller than the second.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.a + lhs.b + lhs.c < rhs.a + rhs.b + rhs.c
    }
}

extension Vector4D where Self: Comparable, Scalar: Comparable {

    /// Returns a Boolean value indicating whether the length of the first vector is smaller than the second.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        let left = lhs.a + lhs.b + lhs.c + lhs.d
        let right = rhs.a + rhs.b + rhs.c + rhs.d
        return left < right
    }
}
