import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CountdownTimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }

            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "clock.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

// View สำหรับตั้งค่า
struct SettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("เปิดเสียงแจ้งเตือน", isOn: .constant(true))
                    .padding()
                Toggle("โหมดมืด", isOn: .constant(false))
                    .padding()
            }
            .navigationTitle("Settings")
        }
    }
}
