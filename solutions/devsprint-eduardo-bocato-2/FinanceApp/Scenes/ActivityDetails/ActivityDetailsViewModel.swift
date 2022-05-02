import Foundation

protocol ActivityDetailsViewModelDelegate: AnyObject {
    func didFetchActivityDetails(_ data: ActivityDetails)
}

struct ActivityDetailsViewModel {
    weak var delegate: ActivityDetailsViewModelDelegate?

    func fetchData() {
        FinanceService().fetchActivityDetails { activityDetails in
            guard let activityDetails = activityDetails else { return }
            DispatchQueue.main.async {
                self.delegate?.didFetchActivityDetails(activityDetails)
            }
        }
    }
}
