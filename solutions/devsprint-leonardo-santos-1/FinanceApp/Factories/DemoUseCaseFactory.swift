/// Utilizar `Reflection (Mirror)` para realizar testes deste factory
final class DemoUseCaseFactory {
    func make() -> DemoUseCaseProtocol {
        let depA = DemoUseCaseDependencyA()
        let depB = DemoUseCaseDependencyB()
        
        return DemoUseCase(
            dependencyA: depA,
            dependencyB: depB
        )
    }
}
