import Foundation
import Arcane

public struct Crypter {

  public static func encrypt(_ data: Data, secret: String) -> Data? {
    guard let keyData = secret.data(using: String.Encoding.utf8) else { return nil }

    return AES.encrypt(data, key: keyData)
  }

  public static func decrypt(_ data: Data, secret: String) -> Data? {
    guard let keyData = secret.data(using: String.Encoding.utf8) else { return nil }

    return AES.decrypt(data, key: keyData)
  }
}
