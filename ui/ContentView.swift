import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 24) {
            Text("Hello, UI!")
                .font(.largeTitle)
                .bold()

            Text("\(count)")
                .font(.system(size: 48, weight: .medium))
                .padding()

            HStack(spacing: 20) {
                Button("−1") {
                    count -= 1
                }
                .buttonStyle(.bordered)
                .tint(.red)

                Button("+1") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
