import SwiftUI

struct FloatingView: View {

    @State private var windowExtended = true
    @State private var selectedScript: String?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color(white: 0.3, opacity: 0.2))
                    .frame(width: .infinity, height: windowExtended ? .infinity : 50.0)
            VStack(alignment: .leading, spacing: 10) {
                ScriptList()
            }.padding(10)
        }
    }
}

struct FloatingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FloatingView()
        }
    }
}
