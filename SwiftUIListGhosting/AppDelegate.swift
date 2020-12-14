import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let floatingView = FloatingView()

        // Create the window and set the content view.
        // https://stackoverflow.com/a/36206109/385127
        window = NSPanel(contentRect: NSRect(x: 0, y: 0, width: 300, height: 200), styleMask: [.unifiedTitleAndToolbar, .borderless, .nonactivatingPanel], backing: .buffered, defer: true)
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        window.orderFrontRegardless()
        window.isReleasedWhenClosed = false
        window.center()
        window.makeKeyAndOrderFront(nil)
        window.level = .mainMenu
        window.backgroundColor = NSColor.clear
        window.isMovableByWindowBackground = true

        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: floatingView)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
    }
}
