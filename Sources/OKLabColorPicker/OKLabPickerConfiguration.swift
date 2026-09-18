import SwiftUI

public enum OKLabPickerMode: String, CaseIterable, Identifiable, Sendable {
    case polarOKLCH = "OKLCH (Wheel)"
    case cartesianOKLab = "OKLab (L, a, b)"
    case perceptualSwatches = "Swatches"
    case colorHarmonies = "Harmonies"

    public var id: String { rawValue }

    public var iconName: String {
        switch self {
        case .polarOKLCH: return "paintpalette.fill"
        case .cartesianOKLab: return "slider.horizontal.3"
        case .perceptualSwatches: return "square.grid.3x3.fill"
        case .colorHarmonies: return "circle.hexagongrid.fill"
        }
    }
}

/// Configuration object for customizing the `OKLabColorPicker` behavior, presentation style, and feature set.
public struct OKLabPickerConfiguration: Sendable, Equatable, Hashable {
    /// Style of the color picker component
    public enum Style: Sendable {
        case inline
        case compact
        case card
    }

    public var style: Style
    public var title: String?
    public var showHeader: Bool
    public var showHexInput: Bool
    public var showAlphaSlider: Bool
    public var showColorMetrics: Bool
    public var showColorHarmonies: Bool
    public var showPresetsGrid: Bool
    public var allowedModes: [OKLabPickerMode]
    public var customPresets: [OKLabColorValue]

    public init(
        style: Style = .inline,
        title: String? = "OKLab Color",
        showHeader: Bool = true,
        showHexInput: Bool = true,
        showAlphaSlider: Bool = false,
        showColorMetrics: Bool = true,
        showColorHarmonies: Bool = false,
        showPresetsGrid: Bool = true,
        allowedModes: [OKLabPickerMode] = OKLabPickerMode.allCases,
        customPresets: [OKLabColorValue] = OKLabColorValue.presets
    ) {
        self.style = style
        self.title = title
        self.showHeader = showHeader
        self.showHexInput = showHexInput
        self.showAlphaSlider = showAlphaSlider
        self.showColorMetrics = showColorMetrics
        self.showColorHarmonies = showColorHarmonies
        self.showPresetsGrid = showPresetsGrid
        self.allowedModes = allowedModes
        self.customPresets = customPresets
    }

    public static let `default` = OKLabPickerConfiguration()

    public static let compact = OKLabPickerConfiguration(
        style: .compact,
        title: nil,
        showHeader: false,
        showHexInput: false,
        showColorHarmonies: false
    )

    public static let full = OKLabPickerConfiguration(
        style: .card,
        title: "OKLab Color",
        showHeader: true,
        showHexInput: true,
        showAlphaSlider: true,
        showColorMetrics: true,
        showColorHarmonies: true,
        showPresetsGrid: true
    )
}
