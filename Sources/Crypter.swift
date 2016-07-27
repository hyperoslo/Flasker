import Foundation
import Arcane

public struct Crypter {

  public static func encrypt(data: NSData, secret: String) -> NSData? {
    guard let keyData = secret.dataUsingEncoding(NSUTF8StringEncoding) else { return nil }

    return AES.encrypt(data, key: keyData)
  }

  public static func decrypt(data: NSData, secret: String) -> NSData? {
    guard let keyData = secret.dataUsingEncoding(NSUTF8StringEncoding) else { return nil }

    return AES.decrypt(data, key: keyData)
  }
}
