import Foundation

struct Launch: Codable, Identifiable {
    let id: Int
    let flightNumber: Int
    let missionName: String
    let rocket: Rocket
    let launchSite: LaunchSite
    let launchDateUTC: String
    let launchPatchImageURL: String?
    let details: String?
}