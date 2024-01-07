import Foundation

struct Core: Codable {
    let coreSerial: String
    let flight: Int
    let block: Int?
    let gridfins: Bool
    let legs: Bool
    let reused: Bool
    let landSuccess: Bool?
    let landingIntent: Bool
    let landingType: String?
    let landingVehicle: String?
}
