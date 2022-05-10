import Combine
import Foundation

final class PublisherCollector<Value, Error: Swift.Error> {
    private var cancellables: Set<AnyCancellable> = .init()
    private(set) var values: [Value] = .init()

    @discardableResult
    func collect(from publisher: AnyPublisher<Value, Error>) -> Self {
        publisher.sink(
            receiveCompletion: { _ in },
            receiveValue: { [weak self] newState in
                self?.values.append(newState)
            }
        ).store(in: &cancellables)
        return self
    }
}
