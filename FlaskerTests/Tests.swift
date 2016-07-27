import XCTest
import Flasker

extension Key {
  static let string = Key(rawValue: "string")
  static let int = Key(rawValue: "int")
  static let float = Key(rawValue: "float")
  static let double = Key(rawValue: "double")
  static let bool = Key(rawValue: "bool")
  static let url = Key(rawValue: "url")
}

class Tests: XCTestCase {

  func testFlask() {

    let flask = Flask(userDefaults: NSUserDefaults.standardUserDefaults(), secret: "")

    flask.set("hello", key: Key.string)
    XCTAssertEqual(flask.get(Key.string), "hello")

    flask.set(10, key: Key.int)
    XCTAssertEqual(flask.get(Key.int), 10)

    flask.set(10.5, key: Key.float)
    XCTAssertEqual(flask.get(Key.float), 10.5)

    flask.set(10.10, key: Key.double)
    XCTAssertEqual(flask.get(Key.double), 10.10)

    flask.set(true, key: Key.bool)
    XCTAssertEqual(flask.get(Key.bool), true)

    let url = NSURL(string: "http://www.google.com")
    flask.set(url!, key: Key.url)
    XCTAssertEqual(flask.get(Key.url), url)
  }

}
