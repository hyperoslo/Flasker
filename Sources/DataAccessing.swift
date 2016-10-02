import Foundation

public protocol DataAccessing {
  
  func get(_ key: Key) -> Data?
  func set(_ data: Data, key: Key)
  func remove(_ key: Key)
}
