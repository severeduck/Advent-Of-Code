
import Foundation

public struct FileLoader {
    
    public static func loadContent(
        forResource resource: String = "input",
        ofType type: String = "txt"
    ) -> String {
        
        let path = Bundle.main.path(forResource: resource, ofType: type)
        let content = FileManager.default.contents(atPath: path!)
        let contentString = String(data: content!, encoding: .utf8)
        
        return contentString!
    }
}
