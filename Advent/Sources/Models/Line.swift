
import Foundation

public struct Line {
    public let start: Point
    public let end: Point
    
    public var coveredPoints: [Point] {
        let distanceX = abs(end.x - start.x)
        let distanceY = abs(end.y - start.y)
        
        var points = [Point]()
        
        for index in 0...max(distanceX, distanceY) {
            let point: Point
            
            let updatedX = start.x < end.x ? start.x + index : start.x - index
            let updatedY = start.y < end.y ? start.y + index : start.y - index
            
            point = Point(
                x: start.x == end.x ? start.x : updatedX,
                y: start.y == end.y ? start.y : updatedY
            )
            
            points.append(point)
        }
                
        return points
    }
}
