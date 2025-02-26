import SwiftUI
import Combine

class CountdownTimerViewModel: ObservableObject {
    @Published var remainingTime: Int = 0
    @Published var isRunning: Bool = false
    
    @Published var hour: Int = 0
    @Published var minute: Int = 1
    @Published var second: Int = 0
    
    private var timer: AnyCancellable?
    private var totalTime: Int = 0  // ใช้สำหรับ Progress Bar

    func startTimer() {
        guard !isRunning else { return }

        isRunning = true
        totalTime = hour * 3600 + minute * 60 + second
        remainingTime = totalTime

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.stopTimer()
                }
            }
    }

    func stopTimer() {
        timer?.cancel()
        timer = nil
        isRunning = false
    }

    func resetTimer() {
        stopTimer()
        remainingTime = 0
    }

    func progress() -> Double {
        return totalTime == 0 ? 0 : Double(remainingTime) / Double(totalTime)
    }

    /// แปลงเวลาเป็น `hh:mm:ss`
    func formattedTime() -> String {
        let hours = remainingTime / 3600
        let minutes = (remainingTime % 3600) / 60
        let seconds = remainingTime % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
