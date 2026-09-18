import XCTest
@testable import OKLabColorPicker

final class OKLabColorTests: XCTestCase {
    func testOKLabToSRGBConversion() {
        // Pure White OKLab (L=1.0, a=0, b=0)
        let white = OKLabColorValue(lightness: 1.0, a: 0.0, b: 0.0)
        let (wR, wG, wB) = white.toSRGB()
        XCTAssertGreaterThanOrEqual(wR, 0.99)
        XCTAssertGreaterThanOrEqual(wG, 0.99)
        XCTAssertGreaterThanOrEqual(wB, 0.99)

        // Pure Black OKLab (L=0.0, a=0, b=0)
        let black = OKLabColorValue(lightness: 0.0, a: 0.0, b: 0.0)
        let (bR, bG, bB) = black.toSRGB()
        XCTAssertLessThanOrEqual(bR, 0.01)
        XCTAssertLessThanOrEqual(bG, 0.01)
        XCTAssertLessThanOrEqual(bB, 0.01)
    }

    func testOKLCHHueAngleRoundtrip() {
        let color = OKLabColorValue(lightness: 0.7, chroma: 0.15, hueDegrees: 180.0)
        XCTAssertEqual(color.hueDegrees, 180.0, accuracy: 0.1)
        XCTAssertEqual(color.chroma, 0.15, accuracy: 0.01)
        XCTAssertEqual(color.lightness, 0.7, accuracy: 0.01)
    }

    func testHexStringGenerationAndParsing() {
        let color = OKLabColorValue(lightness: 0.65, chroma: 0.20, hueDegrees: 25.0)
        let hex = color.hexString
        XCTAssertTrue(hex.hasPrefix("#"))
        XCTAssertEqual(hex.count, 7)

        // Parse back
        let parsed = OKLabColorValue.from(hex: hex)
        XCTAssertNotNil(parsed)
        XCTAssertEqual(parsed?.hexString, hex)
    }

    func testColorHarmonies() {
        let base = OKLabColorValue(lightness: 0.7, chroma: 0.2, hueDegrees: 60.0)

        // Complementary (60 + 180 = 240)
        let comp = base.complementary
        XCTAssertEqual(comp.hueDegrees, 240.0, accuracy: 0.1)

        // Triadic (60 + 120 = 180, 60 + 240 = 300)
        let tri = base.triadic
        XCTAssertEqual(tri.first.hueDegrees, 180.0, accuracy: 0.1)
        XCTAssertEqual(tri.second.hueDegrees, 300.0, accuracy: 0.1)

        // Monochromatic Palette
        let mono = base.monochromaticPalette(steps: 5)
        XCTAssertEqual(mono.count, 5)
    }

    func testWCAGContrastRatio() {
        let white = OKLabColorValue(lightness: 1.0, a: 0, b: 0)
        let black = OKLabColorValue(lightness: 0.0, a: 0, b: 0)

        let ratio = black.contrastRatio(with: white)
        XCTAssertGreaterThanOrEqual(ratio, 20.0) // ~21:1 for black and white
        XCTAssertTrue(black.isWCAGAACompliant(with: white))
    }
}
