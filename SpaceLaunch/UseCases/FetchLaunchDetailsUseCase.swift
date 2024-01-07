import Foundation
import Combine

protocol FetchLaunchDetailsUseCase {
     /// Fetches details for a specific launch.
    func execute(launchId: String) -> AnyPublisher<Launch, Error>
}

class FetchLaunchDetailsUseCaseImpl: FetchLaunchDetailsUseCase {
    private let launchRepository: LaunchRepository

    /// Initialization of fetching the launch details
    /// - Parameter launchRepository: The repository responsible for fetching launch details.
    init(launchRepository: LaunchRepository) {
        self.launchRepository = launchRepository
    }

    func execute(launchId: String) -> AnyPublisher<Launch, Error> {
        return launchRepository.getLaunchDetails(launchId: launchId)
    }
}
