import Foundation
import Combine

protocol FetchLaunchesUseCase {
    /// Fetches details for a all launch.
    func execute() -> AnyPublisher<[Launch], Error>
}

class FetchLaunchesUseCaseImpl: FetchLaunchesUseCase {
    private let launchRepository: LaunchRepository

    init(launchRepository: LaunchRepository) {
        self.launchRepository = launchRepository
    }

    func execute() -> AnyPublisher<[Launch], Error> {
        return launchRepository.getLaunches()
    }
}
