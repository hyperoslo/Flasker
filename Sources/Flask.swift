import Foundation

public struct Flask {
  let accessor: DataAccessing
  let secret: String

  public init(accessor: DataAccessing, secret: String) {
    self.accessor = accessor
    self.secret = secret
  }

  public func remove(key: Key) {
    accessor.remove(key)
  }

  public func get<T: DataConvertible>(key: Key) -> T? {
    if let data = accessor.get(key),
      let decryptedData = Crypter.decrypt(data, secret: secret) {
      return T.decode(decryptedData) as? T
    }
    
    return nil
  }

  public func set<T: DataConvertible>(value: T, key: Key) {
    if let data = value.encode(),
      let encryptedData = Crypter.encrypt(data, secret: secret) {
      accessor.set(encryptedData, key: key)
    }
  }
}
