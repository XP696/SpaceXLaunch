import Foundation

struct Fairings: Codable {
    let reused: Bool
    let recoveryAttempt: Bool
    let recovered: Bool
    let ship: String?
}
