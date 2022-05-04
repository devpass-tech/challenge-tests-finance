import Foundation


struct ActivityDetailsViewModel {
    var didFetchActivityDetails: ((ActivityDetails) -> Void)?

    func fetchData() {
        FinanceService().fetchActivityDetails { [didFetchActivityDetails] activityDetails in
            guard let activityDetails = activityDetails else { return }
            didFetchActivityDetails?(activityDetails)
        }
    }
}
