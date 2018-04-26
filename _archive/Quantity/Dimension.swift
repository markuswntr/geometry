import Foundation

/// Algebraic [dimension](https://en.wikipedia.org/wiki/Dimension) are types that are fully described by a
/// [cardinality](https://en.wikipedia.org/wiki/Cardinality) (i.e the minimum number of coordinates needed
/// to specify any point within it) and the type of measure within that space.
public protocol Dimension {

    /// A type that can represent the measurement of values within that dimension.
    associatedtype Measure: Scalar

    /// The minimum number of coordinates necessary to define a vector within that dimension
    ///
    /// For 1D types `cardinality == 1`; for 2D types `cardinality == 2`; for 3D types `cardinality == 3`, ...
    var cardinality: UInt { get }

    /// The coordinate or value within the dimension
    var coordinate: Measure { get set }

    /// Initializes a new instance of `Self` with all values in all dimensions coordinate set to given `value`.
    ///
    /// - Parameter value: The `value` to set for all coordinates in all dimensions
    init(unified value: Measure)
}

// MARK: Arithmetic

extension SingularDimension: Addible where Measure: Addible {

    /// Adds `other` to `self`.
    ///
    /// - Parameters:
    ///   - lhs: The left hand side value to which `rhs` should be added
    ///   - rhs: The right hand side value to add to `self`.
    public static func += (lhs: inout SingularDimension, rhs: SingularDimension) {
        lhs.coordinate += rhs.coordinate
    }

    /// Returns the sum of `lhs` and `rhs`.
    ///
    /// - Parameters:
    ///   - lhs: The left hand side operant.
    ///   - rhs: The right hand side operant.
    /// - Returns: The sum of `lhs` and `rhs`.
    public static func + (lhs: SingularDimension, rhs: SingularDimension) -> SingularDimension {
        return SingularDimension(coordinate: lhs.coordinate + rhs.coordinate)
    }
}

// MARK: - Ordered Dimensions

/// Defines a one dimensional space - an (in)finite straight line
public struct SingularDimension<Measure>: Dimension where Measure: Scalar {

    /// The minimum number of coordinates that are necessary to define a point in the dimension, in this case `1`.
    public var cardinality: UInt { return 1 }

    /// The coordinate or value within the dimension
    public var coordinate: Measure

    /// Initializes a new instance of `Self` using given `coordinate`.
    ///
    /// - Parameter value: The value to assign as `coordinate`.
    public init(coordinate value: Measure) {
        self.coordinate = value
    }

    /// Initializes a new instance of `Self` with all values in all dimensions coordinate set to given `value`.
    ///
    /// - Parameter value: The `value` to set for all coordinates in all dimensions
    public init(unified value: Measure) {
        self.init(coordinate: value)
    }
}

/// Defines any finite higher ordered dimension that has a cardinality of 2 or more (limited by `UInt.max`)
public struct OrderedDimensions<Space>: Dimension where Space: Dimension {

    /// The minimum number of coordinates that are necessary to define a point in this dimensions.
    /// In this case, the returning value will be the cardinality of the next space + 1 (this) space
    public var cardinality: UInt { return 1 + next.cardinality }

    /// The coordinate or value within the dimension
    public var coordinate: Space.Measure

    /// The next space (and its containing coordinate) in order
    public var next: Space

    /// Initializes a new instance of `Self` using given `coordinate` and `next` space.
    ///
    /// - Parameters:
    ///   - value: The value to assign as `coordinate`.
    ///   - next: The space to assign as `next`.
    public init(coordinate value: Space.Measure, next space: Space) {
        coordinate = value
        next = space
    }

    /// Initializes a new instance of `Self` with all values in all dimensions coordinate set to given `value`.
    ///
    /// - Parameter value: The `value` to set for all coordinates in all dimensions
    public init(unified value: Space.Measure) {
        self.init(coordinate: value, next: Space(unified: value))
    }
}

// MARK: - Common Dimensions

/// Defines a second ordered (2D) space/dimension
public typealias Space2D<Measure: Numeric> = OrderedDimensions<SingularDimension<Measure>>

/// Defines a third ordered (3D) space/dimension
public typealias Space3D<Measure: Numeric> = OrderedDimensions<Space2D<Measure>>

/// Defines a fourth ordered (4D) space/dimension
public typealias Space4D<Measure: Numeric> = OrderedDimensions<Space3D<Measure>>
