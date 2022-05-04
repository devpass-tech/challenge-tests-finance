import UIKit

final class ActivityDetailsViewController: UIViewController {
    private var viewModel: ActivityDetailsViewModel
    
    init(viewModel: ActivityDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindViewModel() {
        viewModel.didFetchActivityDetails = { [view] details in
            (view as? ActivityDetailsView)?.setData(details)
        }
    }
    
    override func loadView() {
        view = ActivityDetailsView()
    }
}
