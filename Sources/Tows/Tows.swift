import SwiftUI

@main
struct HelloWorld: App {
  var body: some Scene {
    WindowGroup {
      Text("Hello World!").padding()
    }
  }

  init() {
    DispatchQueue.main.async {
      NSApp.setActivationPolicy(NSApplication.ActivationPolicy.regular)
      NSApp.activate(ignoringOtherApps: true)
      NSApp.windows.first?.makeKeyAndOrderFront(nil)
    }
  }
}
