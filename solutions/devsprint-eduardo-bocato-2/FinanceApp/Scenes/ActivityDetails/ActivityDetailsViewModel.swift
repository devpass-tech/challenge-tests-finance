import Foundation

protocol ActivityDetailsViewModelDelegate: AnyObject {
    func didFetchActivityDetails(_ data: ActivityDetails)
}

struct ActivityDetailsViewModel {
    weak var delegate: ActivityDetailsViewModelDelegate?

    private let financeService: FinanceService

    init(financeService: FinanceService) {
        self.financeService = financeService
    }

    func fetchData() {
        financeService.fetchActivityDetails { activityDetails in

            guard let activityDetails = activityDetails else { return }

            DispatchQueue.main.async {
                self.delegate?.didFetchActivityDetails(activityDetails)
            }
        }
    }
}
