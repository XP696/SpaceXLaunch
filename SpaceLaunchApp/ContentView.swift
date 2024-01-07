import SwiftUI

@main
struct SpaceXLaunchesApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchListView(viewModel: LaunchListViewModel(
                fetchLaunchesUseCase: FetchLaunchesUseCaseImpl(launchRepository: SpaceXLaunchRepository(apiService: SpaceAPIService())),
                fetchLaunchDetailsUseCase: FetchLaunchDetailsUseCaseImpl(launchRepository: SpaceXLaunchRepository(apiService: SpaceAPIService()))
            ))
        }
    }
}
