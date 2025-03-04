import Foundation

struct Alarm: Identifiable {
    let id: UUID
    var time: String
    var repeatDays: String
    var isEnabled: Bool
}
