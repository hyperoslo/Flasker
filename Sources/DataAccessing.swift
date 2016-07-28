import Foundation

public protocol DataAccessing {
  
  func get(key: Key) -> NSData?
  func set(data: NSData, key: Key)
  func remove(key: Key)
}
