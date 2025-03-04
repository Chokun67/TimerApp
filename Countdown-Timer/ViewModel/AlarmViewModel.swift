import SwiftUI

class AlarmViewModel: ObservableObject {
    @Published var alarms: [Alarm] = [
        Alarm(id: UUID(), time: "07:00 AM", repeatDays: "Weekdays", isEnabled: true),
        Alarm(id: UUID(), time: "08:30 AM", repeatDays: "Weekends", isEnabled: false)
    ]
    
    @Published var showAddAlarm = false
    
    func toggleAlarm(_ alarm: Alarm) {
        if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
            alarms[index].isEnabled.toggle()
        }
    }
    
    func deleteAlarm(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
    
    func addAlarm(time: String, repeatDays: String) {
        let newAlarm = Alarm(id: UUID(), time: time, repeatDays: repeatDays, isEnabled: true)
        alarms.append(newAlarm)
        showAddAlarm = false
    }
}
