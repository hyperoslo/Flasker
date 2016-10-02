import Foundation

extension UserDefaults: DataAccessing {

  public func get(_ key: Key) -> Data? {
    return object(forKey: key.rawValue) as? Data
  }

  public func set(_ data: Data, key: Key) {
    self.set(data, forKey: key.rawValue)
    synchronize()
  }

  public func remove(_ key: Key) {
    removeObject(forKey: key.rawValue)
  }
}
