import SwiftUI
import AVFoundation

struct SettingsView: View {
  static let tag: String? = "Settings"
  var items = Items()
  @State private var showHelp = false
  var helpSet = OnboardData.buildSet(width: .infinity, height: .infinity)
  var body: some View {
    ZStack {
      VStack {
        List {
          Section(header: Text("Help")) {
            helpButton
            ForEach(items.help, id: \.self) { item in
              Link(destination: URL(string: "\(item.url)")!) {
                SettingsRowView(item: item)
              }
            }
          }
          Section(header: Text("Legal")) {
            ForEach(items.legal, id: \.self) { item in
              Link(destination: URL(string: "\(item.url)")!) {
                SettingsRowView(item: item)
              }
            }
          }
          Section(header: Text("Feedback")) {
            ForEach(items.feedback, id: \.self) { item in
              Link(destination: URL(string: "\(item.url)")!) {
                SettingsRowView(item: item)
              }
            }
          }
          Section(header: Text("Miscellaneous")) {
            ForEach(items.miscellaneous, id: \.self) { item in
              Link(destination: URL(string: "\(item.url)")!) {
                SettingsRowView(item: item)
              }
            }
          }
        }.listStyle(GroupedListStyle())
      }
      if showHelp {
        OnboardingScreenView(showOnboarding: $showHelp, onboardSet: helpSet)
      }
    }
  }
  var helpButton: some View {
    Button(action: {
      withAnimation {
        showHelp.toggle()
      }
    }, label: {
      HStack {
        Image(systemName: "info.circle.fill")
        Text("App Info")
      }
    })
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
