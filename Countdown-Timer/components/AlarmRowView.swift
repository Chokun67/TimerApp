import SwiftUI

struct AlarmRowView: View {
    var alarm: Alarm
    var toggleAction: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(alarm.time)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(alarm.repeatDays)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Toggle("", isOn: Binding(
                get: { alarm.isEnabled },
                set: { _ in toggleAction() }
            ))
            .labelsHidden()
        }
        .padding(.vertical, 5)
    }
}
