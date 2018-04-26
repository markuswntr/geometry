import Foundation

// TODO: Check which are directly convertible and which may be lossy

/// Protocol to be implemented by types that are losslessy representable as `Double` values
public protocol DoubleConvertible {

    /// The double representation of `self`
    var double: Double { get }
}

// MARK: - Signed Integer

extension Int16: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension Int32: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension Int64: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension Int: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

// MARK: - Unsigned Integer

extension UInt8: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension UInt16: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension UInt32: DoubleConvertible {
    public var double: Double {
        return Double.init(self)
    }
}

extension UInt64: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension UInt: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

// MARK: - FloatingPoint Types

extension Float80: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension Float: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

extension Double: DoubleConvertible {
    public var double: Double {
        return Double(self)
    }
}

