import Foundation

public protocol DataConvertible {

  associatedtype T

  func encode() -> Data?
  static func decode(_ data: Data) -> T?
}

extension String: DataConvertible {

  public func encode() -> Data? {
    return data(using: String.Encoding.utf8)
  }

  public static func decode(_ data: Data) -> String? {
    return String(data: data, encoding: String.Encoding.utf8)
  }
}

extension NSNumber: DataConvertible {
  
  public func encode() -> Data? {
    return NSKeyedArchiver.archivedData(withRootObject: self)
  }

  public static func decode(_ data: Data) -> NSNumber? {
    return NSKeyedUnarchiver.unarchiveObject(with: data) as? NSNumber
  }
}

extension Bool: DataConvertible {

  public func encode() -> Data? {
    return NSNumber(value: self as Bool).encode()
  }

  public static func decode(_ data: Data) -> Bool? {
    return NSNumber.decode(data)?.boolValue
  }
}

extension Int: DataConvertible {

  public func encode() -> Data? {
    return NSNumber(value: self as Int).encode()
  }

  public static func decode(_ data: Data) -> Int? {
    return NSNumber.decode(data)?.intValue
  }
}

extension Float: DataConvertible {

  public func encode() -> Data? {
    return NSNumber(value: self as Float).encode()
  }

  public static func decode(_ data: Data) -> Float? {
    return NSNumber.decode(data)?.floatValue
  }
}

extension Double: DataConvertible {

  public func encode() -> Data? {
    return NSNumber(value: self as Double).encode()
  }

  public static func decode(_ data: Data) -> Double? {
    return NSNumber.decode(data)?.doubleValue
  }
}

extension URL: DataConvertible {

  public func encode() -> Data? {
    return absoluteString.encode()
  }

  public static func decode(_ data: Data) -> URL? {
    if let string = String.decode(data) {
      return URL(string: string)
    }

    return nil
  }
}

extension Data: DataConvertible {

  public func encode() -> Data? {
    return self
  }

  public static func decode(_ data: Data) -> Data? {
    return data
  }
}
