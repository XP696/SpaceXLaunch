import Foundation
import Combine

// Protocol defining for launch repositories
protocol LaunchRepository {
    func getLaunches() -> AnyPublisher<[Launch], Error>
    func getLaunchDetails(launchId: String) -> AnyPublisher<Launch, Error>
}

class SpaceXLaunchRepository: LaunchRepository {
    private let apiService: SpaceAPIService

    init(apiService: SpaceAPIService) {
        self.apiService = apiService
    }

    // Fetches the list of all available launches from the API and returns them
    func getLaunches() -> AnyPublisher<[Launch], Error> {
        return apiService.fetchLaunches()
    }

    // Fetches details for a specific launch using its ID
    func getLaunchDetails(launchId: String) -> AnyPublisher<Launch, Error> {
        return apiService.fetchLaunchDetails(launchId: launchId)
    }
}
