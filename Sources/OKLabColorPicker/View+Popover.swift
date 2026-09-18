import SwiftUI

public extension View {
    /// Presents an OKLab Color Picker popover attached to the current view.
    func oklabColorPicker(
        isPresented: Binding<Bool>,
        color: Binding<OKLabColorValue>,
        configuration: OKLabPickerConfiguration = .default
    ) -> some View {
        self.popover(isPresented: isPresented) {
            OKLabColorPicker(color: color, configuration: configuration)
                .frame(width: 320)
        }
    }
}
