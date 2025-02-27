import SwiftUI

struct CountdownTimerView: View {
    @StateObject private var viewModel = CountdownTimerViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: geometry.size.height * 0.02) {
                // ✅ Picker สำหรับเลือกเวลา
                HStack {
                    Picker("ชั่วโมง", selection: $viewModel.hour) {
                        ForEach(0..<24, id: \.self) { Text("\($0) h") }
                    }
                    .frame(width: geometry.size.width * 0.25)
                    .clipped()
                    
                    Picker("นาที", selection: $viewModel.minute) {
                        ForEach(0..<60, id: \.self) { Text("\($0) m") }
                    }
                    .frame(width: geometry.size.width * 0.25)
                    .clipped()
                    
                    Picker("วินาที", selection: $viewModel.second) {
                        ForEach(0..<60, id: \.self) { Text("\($0) s") }
                    }
                    .frame(width: geometry.size.width * 0.25)
                    .clipped()
                }
                .pickerStyle(WheelPickerStyle())
                
                // ✅ แสดงเวลาที่เหลือ
                Text(viewModel.formattedTime())
                    .font(.system(size: geometry.size.width * 0.1, weight: .bold))
                
                // ✅ Progress Bar
                ProgressView(value: viewModel.progress(), total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(width: geometry.size.width * 0.6, height: 10)
                
                // ✅ ปุ่มควบคุม (Responsive)
                HStack(spacing: geometry.size.width * 0.05) {
                    controlButton(title: "เริ่ม", color: .green, width: geometry.size.width * 0.20, height: geometry.size.height * 0.06) {
                        viewModel.startTimer()
                    }
                    controlButton(title: "หยุด", color: .red, width: geometry.size.width * 0.20, height: geometry.size.height * 0.06) {
                        viewModel.stopTimer()
                    }
                    controlButton(title: "รีเซ็ต", color: .blue, width: geometry.size.width * 0.20, height: geometry.size.height * 0.06) {
                        viewModel.resetTimer()
                    }
                }
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
    
    // ✅ ฟังก์ชันสร้างปุ่มที่รองรับ Responsive Layout
    private func controlButton(title: String, color: Color, width: CGFloat, height: CGFloat, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: width * 0.18, weight: .bold)) // ปรับขนาดตัวอักษรตามปุ่ม
                .frame(width: width, height: height)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(height * 0.3)
                .shadow(radius: 3)
        }
    }
}
