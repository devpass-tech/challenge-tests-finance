import UIKit

final class SampleViewController<View: UIView>: UIViewController {
    override func loadView() {
        view = View()
    }
}

