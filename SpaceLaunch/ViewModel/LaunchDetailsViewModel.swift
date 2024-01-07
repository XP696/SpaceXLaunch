import Combine

class LaunchDetailsViewModel: ObservableObject {
    @Published var launch: Launch
    private var cancellables: Set<AnyCancellable> = []
    private let fetchLaunchDetailsUseCase: FetchLaunchDetailsUseCase
    private let launchId: String

    // Initialization of launch deatails 
    init(launchId: String, fetchLaunchDetailsUseCase: FetchLaunchDetailsUseCase) {
        self.launchId = launchId
        self.launch = Launch(id: 0, flightNumber: 0, missionName: "", rocket: Rocket(), launchSite: LaunchSite(), launchDateUTC: "", launchPatchImageURL: nil, details: nil)
        self.fetchLaunchDetailsUseCase = fetchLaunchDetailsUseCase
    }

    /// Fetches detailed information for the launch.
    func fetchLaunchDetails() {
        fetchLaunchDetailsUseCase.execute(launchId: launchId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] launchDetails in
                self?.launch = launchDetails
            }
            .store(in: &cancellables)
    }
}
