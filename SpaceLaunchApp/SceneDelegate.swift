import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let apiService = SpaceAPIService()
        let launchRepository = SpaceXLaunchRepository(apiService: apiService)
        let fetchLaunchesUseCase = FetchLaunchesUseCase(launchRepository: launchRepository)
        let fetchLaunchDetailsUseCase = FetchLaunchDetailsUseCase(launchRepository: launchRepository)
        
        // Use LaunchListView as the initial view
        let contentView = LaunchListView(
            viewModel: LaunchListViewModel(
                fetchLaunchesUseCase: fetchLaunchesUseCase,
                fetchLaunchDetailsUseCase: fetchLaunchDetailsUseCase
            )
        )

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
