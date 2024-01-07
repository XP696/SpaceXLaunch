import SwiftUI

struct LaunchListView: View {
    @ObservedObject var viewModel: LaunchListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.launches, id: \.flightNumber) { launch in
                NavigationLink(
                    destination: LaunchDetailsView(viewModel: LaunchDetailsViewModel(launchId: launch.id, fetchLaunchDetailsUseCase: viewModel.fetchLaunchDetailsUseCase))
                ) {
                    LaunchListRow(launch: launch)
                        .onTapGesture {
                            viewModel.fetchLaunchDetails(for: launch.id)
                        }
                }
            }
            .navigationBarTitle("Launches")

            // Check if the device is iPad and in landscape mode
            if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isLandscape {
                // Display a placeholder message when a launch is not selected in landscape on iPad
                Text("Select a launch")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            viewModel.fetchLaunches()
        }
    }
}

struct LaunchListRow: View {
    let launch: Launch

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(launch.missionName)
                    .font(.headline)
                Text("\(launch.rocket.rocketName) (\(launch.rocket.rocketType))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(launch.launchDateUTC)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}