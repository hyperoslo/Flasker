import Foundation

public protocol DataConvertible {

  associatedtype Type

  func encode() -> NSData?
  static func decode(data: NSData) -> Type?
}

extension String: DataConvertible {

  public func encode() -> NSData? {
    return dataUsingEncoding(NSUTF8StringEncoding)
  }

  public static func decode(data: NSData) -> String? {
    return String(data: data, encoding: NSUTF8StringEncoding)
  }
}

extension NSNumber: DataConvertible {
  
  public func encode() -> NSData? {
    return NSKeyedArchiver.archivedDataWithRootObject(self)
  }

  public static func decode(data: NSData) -> NSNumber? {
    return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? NSNumber
  }
}

extension Bool: DataConvertible {

  public func encode() -> NSData? {
    return NSNumber(bool: self).encode()
  }

  public static func decode(data: NSData) -> Bool? {
    return NSNumber.decode(data)?.boolValue
  }
}
