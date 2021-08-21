import SwiftUI

public struct Pie: Shape {
    public var startAngle: Angle
    public var endAngle: Angle
    
    public func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        var p = Path()
        p.move(to: center)
        
        return p
    }
}
