import XCTest
import Flasker

extension Key {
  static let key = Key(rawValue: "key")
}

class Tests: XCTestCase {

  func testExample() {

    let flask = Flask(userDefaults: NSUserDefaults.standardUserDefaults())

    flask.set("hello", key: Key.key)
    XCTAssertEqual(flask.get(Key.key), "hello")
  }

}
