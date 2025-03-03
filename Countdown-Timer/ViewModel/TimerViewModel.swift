import SwiftUI
import Combine

class TimerViewModel: ObservableObject {
    @Published var timeElapsed: TimeInterval = 0
    @Published var isRunning = false
    @Published var laps: [Lap] = []
    
    private var timer: Timer?
    private var startTime: Date?
    
    var timeString: String {
        let minutes = Int(timeElapsed) / 60
        let seconds = Int(timeElapsed) % 60
        let milliseconds = Int((timeElapsed * 100).truncatingRemainder(dividingBy: 100))
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
    
    func toggleTimer() {
        if isRunning {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    func startTimer() {
        startTime = Date().addingTimeInterval(-timeElapsed)
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self, let startTime = self.startTime else { return }
            self.timeElapsed = Date().timeIntervalSince(startTime)
        }
        isRunning = true
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func resetTimer() {
        stopTimer()
        timeElapsed = 0
        laps.removeAll()
    }
    
    func recordLap() {
        let newLap = Lap(id: laps.count + 1, time: timeString)
        laps.append(newLap)
    }
}
