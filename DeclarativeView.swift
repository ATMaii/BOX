import SwiftUI

struct DeclarativeView: View {
    @State private var isOn = false

    var body: some View {
        VStack(spacing: 20) {
            Toggle("เปิด/ปิด", isOn: $isOn)
                .padding()

            Text(isOn ? "สวิตช์เปิดอยู่" : "สวิตช์ปิดอยู่")
                .font(.headline)
                .foregroundColor(isOn ? .green : .red)
        }
        .padding()
    }
}

struct DeclarativeView_Previews: PreviewProvider {
    static var previews: some View {
        DeclarativeView()
    }
}