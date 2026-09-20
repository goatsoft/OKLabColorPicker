import Testing
import SwiftUI
@testable import OKLabColorPicker

@Suite("OKLabColorValue Tests")
struct OKLabColorValueTests {

    @Test("Initialization & OKLCH polar conversions")
    func testPolarInitialization() {
        let color = OKLabColorValue(lightness: 0.7, chroma: 0.15, hueDegrees: 90.0)
        #expect(abs(color.lightness - 0.7) < 0.001)
        #expect(abs(color.chroma - 0.15) < 0.01)
        #expect(abs(color.hueDegrees - 90.0) < 0.1)
    }

    @Test("Hex string parsing and generation")
    func testHexParsing() {
        let hex = "#FF5733"
        let color = OKLabColorValue.from(hex: hex)
        #expect(color != nil)
        #expect(color?.hexString == "#FF5733")

        let hexShort = "#F00"
        let redColor = OKLabColorValue.from(hex: hexShort)
        #expect(redColor != nil)
        #expect(redColor?.hexString == "#FF0000")
    }

    @Test("Color Harmonies generation")
    func testHarmonies() {
        let base = OKLabColorValue(lightness: 0.65, chroma: 0.20, hueDegrees: 45.0)
        let comp = base.complementary
        #expect(abs(comp.hueDegrees - 225.0) < 0.1)

        let harmonies = base.harmonies()
        #expect(harmonies.count == 5)
    }

    @Test("WCAG Contrast Ratio calculation")
    func testWCAGContrast() {
        let white = OKLabColorValue(lightness: 1.0, a: 0, b: 0)
        let black = OKLabColorValue(lightness: 0.0, a: 0, b: 0)
        let contrast = white.contrastRatio(with: black)

        #expect(contrast >= 18.0)
        #expect(black.isWCAGAACompliant(with: white))
    }
}
