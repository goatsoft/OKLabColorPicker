import SwiftUI

/// A ready-to-use color picker button that displays a live color swatch and opens an OKLab color picker popover/dialog.
public struct OKLabColorPickerButton: View {
    @Binding public var color: OKLabColorValue
    public var label: String?
    public var configuration: OKLabPickerConfiguration

    @State private var isPickerPresented: Bool = false

    public init(
        color: Binding<OKLabColorValue>,
        label: String? = nil,
        configuration: OKLabPickerConfiguration = .default
    ) {
        self._color = color
        self.label = label
        self.configuration = configuration
    }

    public var body: some View {
        Button {
            isPickerPresented.toggle()
        } label: {
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(color.color)
                    .frame(width: 22, height: 22)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.primary.opacity(0.15), lineWidth: 1)
                    )

                if let label = label {
                    Text(label)
                        .font(.body)
                }

                Text(color.hexString)
                    .font(.system(.caption, design: .monospaced))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.primary.opacity(0.06))
            )
        }
        .buttonStyle(.plain)
        .popover(isPresented: $isPickerPresented, arrowEdge: .bottom) {
            OKLabColorPicker(color: $color, configuration: configuration)
                .frame(width: 320)
        }
    }
}

#Preview {
    OKLabColorPickerButton(color: .constant(OKLabColorValue(lightness: 0.7, chroma: 0.18, hueDegrees: 240.0)), label: "Badge Color")
        .padding(40)
}
