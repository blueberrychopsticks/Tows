import SwiftUI
import cows  // @AlwaysRightInstitute

struct ContentView: View {

  @State var searchString = ""
  @State var matches = cows.allCows
  @State var selectedCow: String?

  let font = Font(NSFont.monospacedSystemFont(ofSize: NSFont.systemFontSize, weight: .regular))

  var body: some View {
    NavigationView {
      ScrollView {
        TextField("Search", text: $searchString)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding(8)
          .onChange(of: searchString) { newValue in
            matches =
              newValue.isEmpty ? cows.allCows : cows.allCows.filter { $0.contains(newValue) }
          }
        Spacer()
      }

      ScrollView {
        VStack(spacing: 0) {
          if matches.isEmpty {
            Text("Didn't find cows matching '\(searchString)' 🐮")
              .font(font)
              .padding(8)
          }

          ForEach(matches.isEmpty ? allCows : matches, id: \.self) { cow in
            Text(verbatim: cow)
              .font(font)
              .onDrag {
                NSItemProvider(object: cow as NSString)
              }
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 16)
                  .strokeBorder()
                  .padding(4)
                  .opacity(selectedCow == cow ? 1 : 0)
              )
              .frame(maxWidth: .infinity)
              .contentShape(Rectangle())
              .onTapGesture {
                selectedCow = selectedCow == cow ? nil : cow
              }
          }
        }
      }
      .ignoresSafeArea()
    }
  }
}
