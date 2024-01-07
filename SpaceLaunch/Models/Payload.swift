import Foundation

struct Payload: Codable {
    let payloadID: String
    let noradID: [Int]
    let reused: Bool
    let customers: [String]
    let nationality: String
    let manufacturer: String
    let payloadType: String
    let payloadMassKg: Double
    let payloadMassLbs: Double
    let orbit: String
    let orbitParams: OrbitParams
}
