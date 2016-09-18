/// These Foundation conformances are acceptable since we already depend on Foundation. No other frameworks
/// Should be important as part of Mapper for default conformances. Consumers should conform any other common
/// Types in an extension in their own projects (e.g. `CGFloat`)
import Foundation


//MARK: - Default Extensions

extension String: DefaultConvertible {}
extension Int: DefaultConvertible {}
extension UInt: DefaultConvertible {}
extension Float: DefaultConvertible {}
extension Double: DefaultConvertible {}
extension Bool: DefaultConvertible {}
extension NSNumber: DefaultConvertible{}
extension NSDictionary: DefaultConvertible {}
extension NSArray: DefaultConvertible {}

//MARK:- NSDate Extension

/**
 NSDate Convertible implementation
 */
extension NSDate : Convertible{
    
    /**
     Create a NSDate from Mapper
     
     - parameter value: The timestamp passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a String
     - throws: MapperError.CustomError      if the passed value a String but the NSURL initializer returns nil
     - returns: The date created with the timestamp
     */
    public static func fromMap(value: AnyObject?) throws -> NSDate {
        guard let timestamp = value as? NSTimeInterval else {
            throw MapperError.ConvertibleError(value: value, type: NSTimeInterval.self)
        }
        return NSDate(timeIntervalSince1970: timestamp)
    }
}


//MARK:- NSURL Extension

/**
 NSURL Convertible implementation
 */
extension NSURL: Convertible {
    /**
     Create a NSURL from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a String
     - throws: MapperError.CustomError      if the passed value a String but the NSURL initializer returns nil
     - returns: The created NSURL
     */
    public static func fromMap(value: AnyObject?) throws -> NSURL {
        guard let string = value as? String else {
            throw MapperError.ConvertibleError(value: value, type: String.self)
        }
        
        if let URL = NSURL(string: string) {
            return URL
        }
        
        throw MapperError.CustomError(field: nil, message: "'\(string)' is not a valid NSURL")
    }
}

//MARK:- Numbers Extensions

/**
 Int64 Convertible implementation
 */
extension Int64:Convertible{
    
    /**
     Create a Int64 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created Int64
     */
    public static func fromMap(value: AnyObject?) throws -> Int64 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: Int64.self)
        }
        return number.longLongValue
    }
}

/**
 UInt64 Convertible implementation
 */
extension UInt64:Convertible{
    
    /**
     Create a UInt64 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created UInt64
     */
    public static func fromMap(value: AnyObject?) throws -> UInt64 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: UInt64.self)
        }
        return number.unsignedLongLongValue
    }
}

/**
 Int32 Convertible implementation
 */
extension Int32:Convertible{
    
    /**
     Create a Int32 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created Int32
     */
    public static func fromMap(value: AnyObject?) throws -> Int32 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: Int32.self)
        }
        return number.intValue
    }
}

/**
 UInt32 Convertible implementation
 */
extension UInt32:Convertible{
    
    /**
     Create a UInt32 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created UInt32
     */
    public static func fromMap(value: AnyObject?) throws -> UInt32 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: UInt32.self)
        }
        return number.unsignedIntValue
    }
}

/**
 Int16 Convertible implementation
 */
extension Int16:Convertible{
    
    /**
     Create a Int16 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created Int16
     */
    public static func fromMap(value: AnyObject?) throws -> Int16 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: Int16.self)
        }
        return number.shortValue
    }
}

/**
 UInt16 Convertible implementation
 */
extension UInt16:Convertible{
    
    /**
     Create a UInt16 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created UInt16
     */
    public static func fromMap(value: AnyObject?) throws -> UInt16 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: UInt16.self)
        }
        return number.unsignedShortValue
    }
}

/**
 Int8 Convertible implementation
 */
extension Int8:Convertible{
    
    /**
     Create a Int8 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created Int8
     */
    public static func fromMap(value: AnyObject?) throws -> Int8 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: Int8.self)
        }
        return number.charValue
    }
}

/**
 UInt8 Convertible implementation
 */
extension UInt8:Convertible{
    
    /**
     Create a UInt8 from Mapper
     
     - parameter value: The object (or nil) passed from Mapper
     - throws: MapperError.ConvertibleError if the passed value is not a Number
     - returns: The created UInt8
     */
    public static func fromMap(value: AnyObject?) throws -> UInt8 {
        guard let number = value as? NSNumber else {
            throw MapperError.ConvertibleError(value: value, type: UInt8.self)
        }
        return number.unsignedCharValue
    }
}
