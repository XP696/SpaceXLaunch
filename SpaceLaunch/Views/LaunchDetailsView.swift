import SwiftUI

struct LaunchDetailsView: View {
    @ObservedObject var viewModel: LaunchDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.launch.missionName)
                    .font(.title)

                Text("Rocket: \(viewModel.launch.rocket.rocketName) (\(viewModel.launch.rocket.rocketType))")
                    .font(.subheadline)

                Text("Launch Site: \(viewModel.launch.launchSite.siteNameLong)")
                    .font(.subheadline)

                Text("Launch Date: \(viewModel.launch.launchDateUTC)")
                    .font(.subheadline)

                Text("Launch Success: \(viewModel.launch.launchSuccess ? "Yes" : "No")")
                    .font(.subheadline)

                if let failureDetails = viewModel.launch.launchFailureDetails {
                    Text("Failure Details:")
                        .font(.headline)
                    Text("Time: \(failureDetails.time) seconds")
                    Text("Reason: \(failureDetails.reason)")
                }

                if let details = viewModel.launch.details {
                    Text("Additional Details: \(details)")
                        .font(.body)
                } else {
                    Text("No additional details available.")
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationBarTitle("Launch Details", displayMode: .inline)
        .onAppear {
            viewModel.fetchLaunchDetails()
        }
    }
}
