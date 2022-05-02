import UIKit

extension NSObject {
    static var className: String { String(describing: self) }
}
