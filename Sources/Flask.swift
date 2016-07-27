import Foundation

public struct Flask {
  let userDefaults: NSUserDefaults

  public init(userDefaults: NSUserDefaults) {
    self.userDefaults = userDefaults
  }

  public func remove(key: Key) {
    userDefaults.removeObjectForKey(key.rawValue)
  }

  public func get<T: DataConvertible>(key: Key) -> T? {
    if let data = userDefaults.objectForKey(key.rawValue) as? NSData,
      let decryptedData = Crypter.decrypt(data) {
      return T.decode(decryptedData) as? T
    }
    
    return nil
  }

  public func set<T: DataConvertible>(value: T, key: Key) {
    if let data = value.encode(),
      let encryptedData = Crypter.encrypt(data) {
      userDefaults.setObject(encryptedData, forKey: key.rawValue)
    }
  }
}
