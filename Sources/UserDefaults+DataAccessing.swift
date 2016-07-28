import Foundation

extension NSUserDefaults: DataAccessing {

  public func get(key: Key) -> NSData? {
    return objectForKey(key.rawValue) as? NSData
  }

  public func set(data: NSData, key: Key) {
    setObject(data, forKey: key.rawValue)
    synchronize()
  }

  public func remove(key: Key) {
    removeObjectForKey(key.rawValue)
  }
}
