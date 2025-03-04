import SwiftUI

struct AlarmView: View {
    @StateObject private var viewModel = AlarmViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.alarms) { alarm in
                        AlarmRowView(alarm: alarm, toggleAction: {
                            viewModel.toggleAlarm(alarm)
                        })
                    }
                    .onDelete(perform: viewModel.deleteAlarm)
                }
                
                Button(action: {
                    viewModel.showAddAlarm = true
                }) {
                    Text("+ Add Alarm")
                        .font(.title2)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Alarms")
            .sheet(isPresented: $viewModel.showAddAlarm) {
                AddAlarmView(viewModel: viewModel)
            }
        }
    }
}
