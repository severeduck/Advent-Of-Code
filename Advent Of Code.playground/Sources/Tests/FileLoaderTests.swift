
import XCTest

public class FileLoaderTests: XCTestCase {
    func testFileLoad() {
        let content = FileLoader.loadContent(forResource: "file_loader_test_input", ofType: "txt")
        XCTAssertEqual(content.count, 6)
    }
}

