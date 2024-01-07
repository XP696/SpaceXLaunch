import Combine

class LaunchListViewModel: ObservableObject {

    /// Published property for the list of launches.
    @Published var launches: [Launch] = []

    private var cancellables: Set<AnyCancellable> = []
    private let fetchLaunchesUseCase: FetchLaunchesUseCase
    private let fetchLaunchDetailsUseCase: FetchLaunchDetailsUseCase

    // Initialization of launch deatails 
    init(fetchLaunchesUseCase: FetchLaunchesUseCase, fetchLaunchDetailsUseCase: FetchLaunchDetailsUseCase) {
        self.fetchLaunchesUseCase = fetchLaunchesUseCase
        self.fetchLaunchDetailsUseCase = fetchLaunchDetailsUseCase
    }

    /// Fetches the list of space launches.
    func fetchLaunches() {
        fetchLaunchesUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] launches in
                self?.launches = launches
            }
            .store(in: &cancellables)
    }

    /// Fetches detailed information for a specific launch.
    /// - Parameter launchId: The unique identifier of the launch.
    func fetchLaunchDetails(for launchId: String) {
        fetchLaunchDetailsUseCase.execute(launchId: launchId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] launchDetails in
                print("Fetched launch details: \(launchDetails)")
            }
            .store(in: &cancellables)
    }
}
