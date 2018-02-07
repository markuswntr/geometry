//import Foundation
//
//public struct Vector {
//
//    public var length: Unit { return x * y }
//}
//
///// <#Description#>
//public typealias Line = Vector
//
//
///// A type that can represent the absolute value of any possible value of the
///// conforming type.
//associatedtype Magnitude : Comparable, Numeric
//
///// The magnitude of this value.
/////
///// For any numeric value `x`, `x.magnitude` is the absolute value of `x`.
///// You can use the `magnitude` property in operations that are simpler to
///// implement in terms of unsigned values, such as printing the value of an
///// integer, which is just printing a '-' character in front of an absolute
///// value.
/////
/////     let x = -200
/////     // x.magnitude == 200
/////
///// The global `abs(_:)` function provides more familiar syntax when you need
///// to find an absolute value. In addition, because `abs(_:)` always returns
///// a value of the same type, even in a generic context, using the function
///// instead of the `magnitude` property is encouraged.
//public var magnitude: Unit { get }
