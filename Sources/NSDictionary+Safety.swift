import Foundation

extension Dictionary where Key == AnyHashable {
    func safeValueWith(keyPath: String) -> Any? {
        var object: Any? = self
        var keys = keyPath.split(separator: ".").map(String.init)

        while keys.count > 0, let currentObject = object {
            let key = keys.remove(at: 0)
            object = (currentObject as? NSDictionary)?[key] as Any?
        }

        return object
    }
}
