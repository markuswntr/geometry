import Foundation

/// A geometry that is defined by a point and size in a two-dimensional space (a box).
public struct Box2D<Unit> where Unit: Numeric & Comparable {

    /// The origin of the box, the "starting point".
    public var origin: Point2D<Unit>

    /// The size of the box.
    public var size: Size2D<Unit>

    public init(origin: Point2D<Unit>, size: Size2D<Unit>) {
        self.origin = origin
        self.size = size
    }
}

extension Box2D {

    /// Convenience init
    public init(x: Unit, y: Unit, width: Unit, height: Unit) {
        self.init(origin: Point2D(a: x, b: y), size: Size2D(a: width, b: height))
    }
}

extension Box2D where Unit: ExpressibleByIntegerLiteral {

    /// Box at the origin whose width and height are both zero.
    public static var zero: Box2D<Unit> {
        return Box2D(origin: .zero, size: .zero)
    }
}

extension Box2D where Unit: BinaryInteger {

    /// The center point of the rectangle.
    public var center: Point2D<Unit> {
        return Point2D<Unit>(
            x: origin.x + (size.width >> 1),
            y: origin.x + (size.height >> 1)
        )
    }
}

extension Box2D where Unit: FloatingPoint {

    /// The center point of the rectangle.
    public var center: Point2D<Unit> {
        return Point2D<Unit>(
            x: origin.x + (size.width / 2),
            y: origin.x + (size.height / 2)
        )
    }
}
