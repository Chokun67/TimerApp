import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.timeString)
                    .font(.system(size: 60, weight: .bold, design: .monospaced))
                    .padding()
                
                HStack {
                    Button(action: {
                        viewModel.resetTimer()
                    }) {
                        CircleButtonView(label: "Reset", color: .gray)
                    }
                    .disabled(!viewModel.isRunning && viewModel.laps.isEmpty)
                    
                    Button(action: {
                        viewModel.toggleTimer()
                    }) {
                        CircleButtonView(label: viewModel.isRunning ? "Stop" : "Start", color: viewModel.isRunning ? .red : .green)
                    }
                    
                    Button(action: {
                        viewModel.recordLap()
                    }) {
                        CircleButtonView(label: "Lap", color: .blue)
                    }
                    .disabled(!viewModel.isRunning)
                }
                .padding()
                
                List(viewModel.laps.reversed()) { lap in
                    HStack {
                        Text("Lap \(lap.id)")
                            .font(.headline)
                        Spacer()
                        Text(lap.time)
                            .font(.system(.body, design: .monospaced))
                    }
                }
            }
            .navigationTitle("Stopwatch")
        }
    }
}

// ปุ่มแบบวงกลม
struct CircleButtonView: View {
    let label: String
    let color: Color
    
    var body: some View {
        Text(label)
            .frame(width: 80, height: 80)
            .background(color)
            .foregroundColor(.white)
            .clipShape(Circle())
            .font(.title2)
    }
}

