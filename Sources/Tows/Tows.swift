import SwiftUI

@main
struct HelloWorld: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .frame(minWidth: 640, minHeight: 320)
    }
    .windowStyle(HiddenTitleBarWindowStyle())
  }

  init() {
    DispatchQueue.main.async {
      NSApp.setActivationPolicy(NSApplication.ActivationPolicy.regular)
      NSApp.activate(ignoringOtherApps: true)
      NSApp.windows.first?.makeKeyAndOrderFront(nil)
    }
  }
}
