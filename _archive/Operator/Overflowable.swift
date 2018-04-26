import Foundation

/// Defines types that may overflow during additive or subtractive operations.
public protocol Overflowable {

    /// Returns the sum of the two given values, discarding any overflow.
    ///
    /// The masking addition operator (`&+`) silently discards any overflow that
    /// occurs during the operation. In the following example, the sum of `100`
    /// and `121` is greater than the maximum representable `Int8` value, so the
    /// result is the overflowed value:
    ///
    ///     let x: Int8 = 10 &+ 21
    ///     // x == 31
    ///     let y: Int8 = 100 &+ 121
    ///     // y == -35 (after overflow)
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func &+ (lhs: Self, rhs: Self) -> Self

    /// Returns the difference of the two given values, discarding any overflow.
    ///
    /// The masking subtraction operator (`&-`) silently discards any overflow
    /// that occurs during the operation. In the following example, the
    /// difference of `10` and `21` is less than zero, the minimum representable
    /// `UInt` value, so the result is the overflowed value:
    ///
    ///     let x: UInt8 = 21 &- 10
    ///     // x == 11
    ///     let y: UInt8 = 10 &- 21
    ///     // y == 245 (after overflow)
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func &- (lhs: Self, rhs: Self) -> Self

    /// Returns the product of the two given values, discarding any overflow.
    ///
    /// The masking multiplication operator (`&*`) silently discards any overflow
    /// that occurs during the operation. In the following example, the product
    /// of `10` and `50` is greater than the maximum representable `Int8` value,
    /// so the result is the overflowed value:
    ///
    ///     let x: Int8 = 10 &* 5
    ///     // x == 50
    ///     let y: Int8 = 10 &* 50
    ///     // y == -12 (after overflow)
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func &* (lhs: Self, rhs: Self) -> Self
}
