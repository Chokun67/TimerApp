import SwiftUI

struct AddAlarmView: View {
    @ObservedObject var viewModel: AlarmViewModel
    @State private var selectedTime = Date()
    @State private var repeatDays = "Everyday"

    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                
                Picker("Repeat", selection: $repeatDays) {
                    Text("Everyday").tag("Everyday")
                    Text("Weekdays").tag("Weekdays")
                    Text("Weekends").tag("Weekends")
                }
                
                Button("Save") {
                    let formatter = DateFormatter()
                    formatter.timeStyle = .short
                    let timeString = formatter.string(from: selectedTime)
                    
                    viewModel.addAlarm(time: timeString, repeatDays: repeatDays)
                }
            }
            .navigationTitle("New Alarm")
        }
    }
}
