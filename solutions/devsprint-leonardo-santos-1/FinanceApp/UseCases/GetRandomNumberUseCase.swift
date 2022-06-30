protocol GetRandomNumberUseCaseProtocol {
    func execute(
        from initialNumber: Int,
        to finalNumber: Int,
        exceptions: [Int]?
    ) -> Int
}

final class GetRandomNumberUseCase: GetRandomNumberUseCaseProtocol {
    func execute(
        from initialNumber: Int,
        to finalNumber: Int,
        exceptions: [Int]? = nil
    ) -> Int {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: initialNumber...finalNumber)
        } while exceptions?.contains(randomNumber) == true

        return randomNumber
    }
}
