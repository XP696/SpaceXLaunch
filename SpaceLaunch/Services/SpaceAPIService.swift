import Foundation
import Combine

class SpaceAPIService {
    private let apiUrl = "https://api.spacexdata.com/v3/launches"

    // Fetch all launches
    func fetchLaunches() -> AnyPublisher<[Launch], Error> {
        guard let url = URL(string: apiUrl) else {
            fatalError("Invalid API URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Launch].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    // Fetch details for a specific launch using its ID
    func fetchLaunchDetails(launchId: String) -> AnyPublisher<Launch, Error> {
        guard let url = URL(string: "\(apiUrl)/\(launchId)") else {
            fatalError("Invalid API URL for launch details")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Launch.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}