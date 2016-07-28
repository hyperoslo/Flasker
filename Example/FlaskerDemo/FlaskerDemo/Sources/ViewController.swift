import UIKit
import Flasker

extension Key {
  static var key = Key(rawValue: "key")
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()

    let flask = Flask(userDefaults: NSUserDefaults.standardUserDefaults(), secret: "secret")
    flask.set("hello world", key: Key.key)

    let value: String? = flask.get(Key.key)
    print(value)
  }
}

