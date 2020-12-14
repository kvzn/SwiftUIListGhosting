import SwiftUI

var scripts: [String] = (1...20).map { (i: Int) -> String in String(NSUUID().uuidString.split(separator: "-").last!) }

//extension NSTableView {
//    open override func viewDidMoveToWindow() {
//        super.viewDidMoveToWindow()
//
//        backgroundColor = NSColor.clear
//        enclosingScrollView!.drawsBackground = false
//    }
//}

struct ScriptListRow: View {

    var script: String
    var index: Int

    @State private var onHovering: Bool = false

    var body: some View {
        HStack {
            Text(script)
                    .foregroundColor(Color.white)
            Spacer()
        }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(onHovering ? Color.red : Color.clear)
                .onHover { hovering in
                    onHovering = hovering
                }
    }
}

struct ScriptList: View {

    @State private var selectedId: Int?

    let withIndex = scripts.enumerated().map({ $0 })

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(withIndex, id: \.element) { index, script in
                    ScriptListRow(script: script, index: index)
                            .background(selectedId == index ? Color.accentColor : (index % 2 == 1 ? Color.clear : Color(white: 0.1, opacity: 0.2)))
                            .onTapGesture(perform: {
                                selectedId = index
                            })
                }
            }
        }
                .frame(width: .infinity, height: 300, alignment: .top)
    }
}

struct ScriptList_Previews: PreviewProvider {
    static var previews: some View {
        ScriptList()
    }
}
