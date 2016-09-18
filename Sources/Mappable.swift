import Foundation

/**
 The Mappable protocol defines how to create a custom object from a Mapper

 Example:

 public struct Thing: Mappable {
    let string: String
    let URL: NSURL?

    public init(map: Mapper) throws {
        // Attemps to convert the value for the "some_string" key to a String, if it fails
        // it throws an error
        try string = map.from("some_string")

        // Attemps to convert the value for the "base_url" key to an NSURL, if it fails
        // it assigns URL to nil
        URL = map.from("base_url")
    }
 }
 */
public protocol Mappable {
    /**
     Define how your custom object is created from a Mapper object
     */
    @warn_unused_result
    init(map: Mapper) throws
}


/**
 Tries to initialize a Mappable object with a JSON object
 - parameter: JSON Dictionary
 - returns: The object created or nil, if the JSON is invalid
 
 */
public extension Mappable{
    public static func from(JSON: AnyObject) -> Self? {
        if let inputValue = JSON as? [String:AnyObject]{
            return try? self.init(map: Mapper(JSON: inputValue))
        }
        return nil
    }
}

/**
 Maps a json array to an array of desired object
 
 - parameter: JSON array
 - returns: An array with the desired object, nil if the array cannot be parsed, an empty array if the json dictionary are not valid, will return any object that can be parsed, even if some fail.
 */
public extension Array where Element: Mappable{
    
    public static func from(JSON: AnyObject) -> [Element]? {
        if let inputArray = JSON as? [[String:AnyObject]] {
            return inputArray.map({ try? Element(map: Mapper(JSON: $0))}).flatMap({$0})
        }
        return nil
    }
}
