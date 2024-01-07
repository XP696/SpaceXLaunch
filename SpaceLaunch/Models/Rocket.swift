import Foundation

struct Rocket: Codable {
    let rocketName: String
    let rocketType: String
    let firstStage: FirstStage
    let secondStage: SecondStage
    let fairings: Fairings?
}
