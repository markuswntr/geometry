import Foundation

/// A geometry that is defined by a point and size in a two-dimensional space (a box).
public struct Box2D<Unit> where Unit: Scalar & Comparable {

    public var point: Point2D<Unit>

    public var size: Size2D<Unit>

    public init(point: Point2D<Unit>, size: Size2D<Unit>) {
        self.point = point
        self.size = size
    }
}
