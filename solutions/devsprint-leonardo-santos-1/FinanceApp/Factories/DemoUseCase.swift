protocol DemoUseCaseProtocol {}

final class DemoUseCase: DemoUseCaseProtocol {
    private let dependencyA: DemoUseCaseDependencyAProtocol
    private let dependencyB: DemoUseCaseDependencyBProtocol
    
    init(
        dependencyA: DemoUseCaseDependencyAProtocol,
        dependencyB: DemoUseCaseDependencyBProtocol
    ) {
        self.dependencyA = dependencyA
        self.dependencyB = dependencyB
    }
}

// MARK: - DependencyA

protocol DemoUseCaseDependencyAProtocol {}
final class DemoUseCaseDependencyA: DemoUseCaseDependencyAProtocol {}

// MARK: - DependencyB

protocol DemoUseCaseDependencyBProtocol {}
final class DemoUseCaseDependencyB: DemoUseCaseDependencyBProtocol {}
