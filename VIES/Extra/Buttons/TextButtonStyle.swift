import SwiftUI

struct TextButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
            .font(Font.system(.title,
                              design: .default)
                    .weight(.semibold))
            .padding()

    }
}
