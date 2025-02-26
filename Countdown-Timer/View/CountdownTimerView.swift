import SwiftUI

struct CountdownTimerView: View {
    @StateObject private var viewModel = CountdownTimerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // ✅ Picker สำหรับเลือกเวลา
            HStack {
                Picker("ชั่วโมง", selection: $viewModel.hour) {
                    ForEach(0..<24, id: \.self) { Text("\($0) h") }
                }
                .frame(width: 80)
                .clipped()

                Picker("นาที", selection: $viewModel.minute) {
                    ForEach(0..<60, id: \.self) { Text("\($0) m") }
                }
                .frame(width: 80)
                .clipped()

                Picker("วินาที", selection: $viewModel.second) {
                    ForEach(0..<60, id: \.self) { Text("\($0) s") }
                }
                .frame(width: 80)
                .clipped()
            }
            .pickerStyle(WheelPickerStyle())
            
            // ✅ แสดงเวลาที่เหลือ
            Text(viewModel.formattedTime())
                .font(.largeTitle)
                .fontWeight(.bold)

            // ✅ Progress Bar
            ProgressView(value: viewModel.progress(), total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .frame(width: 200, height: 10)

            // ✅ ปุ่มควบคุม
            HStack {
                Button(action: { viewModel.startTimer() }) {
                    Text("เริ่ม")
                        .frame(width: 80, height: 40)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: { viewModel.stopTimer() }) {
                    Text("หยุด")
                        .frame(width: 80, height: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: { viewModel.resetTimer() }) {
                    Text("รีเซ็ต")
                        .frame(width: 80, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}
