import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AlarmView()
                .tabItem {
                    Label("Alarm", systemImage: "alarm.fill")
                }
            
            CountdownTimerView()
                .tabItem {
                    Label("Countdown", systemImage: "hourglass")
                }

            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            
        }
    }
}
