import Foundation

struct OrbitParams: Codable {
    let referenceSystem: String
    let regime: String
    let longitude: Double?
    let semiMajorAxisKm: Double?
}
