# 🎨 OKLabColorPicker

A modern, high-precision **OKLab & OKLCH Color Picker** built in Swift & SwiftUI for macOS 14+ and iOS 17+.

Unlike traditional RGB or HSL color pickers, `OKLabColorPicker` operates in the **OKLab / OKLCH perceptually uniform color space**, ensuring consistent perceptual lightness ($L$), linear chroma gradients ($C$), and natural hue transitions ($H$).

---

## ✨ Features

- **Perceptually Uniform 2D OKLCH Color Wheel**: Anti-aliased high-DPI canvas wheel for intuitive hue and chroma selection.
- **Multiple Picker Modes**:
  - `OKLCH (Wheel)` — 2D polar canvas wheel with interactive lightness slider.
  - `OKLab (L, a, b)` — Precision linear sliders for OKLab axes.
  - `Swatches` — Grid of curated perceptually uniform color presets.
  - `Harmonies` — Automatic perceptual complementary, triadic, and analogous color generators.
- **Realtime Hex Sync & Metrics**: Display and edit raw `#HEX` codes live alongside WCAG AA contrast ratio indicators.
- **Swift Package Manager (SPM)**: Zero external dependencies; lightweight and easy to integrate.

---

## 🚀 Installation

Add `OKLabColorPicker` to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/OKLabColorPicker.git", from: "0.1.0")
]
```

---

## 💻 Usage Example

```swift
import SwiftUI
import OKLabColorPicker

struct ExampleView: View {
    @State private var color = OKLabColorValue(lightness: 0.70, chroma: 0.18, hueDegrees: 55.0)
    @State private var mode: OKLabPickerMode = .polarOKLCH

    var body: some View {
        OKLabColorPicker(
            color: $color,
            mode: $mode,
            configuration: OKLabPickerConfiguration(
                style: .card,
                showHeader: true,
                showHexInput: true,
                showColorMetrics: true
            )
        )
    }
}
```

---

## 📄 License

Licensed under the MIT License.
