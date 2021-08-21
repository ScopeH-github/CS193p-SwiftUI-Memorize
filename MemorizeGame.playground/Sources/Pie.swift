import SwiftUI

public struct Pie: Shape {
    public var startAngle: Angle
    public var endAngle: Angle
    public var clockwise: Bool = false
    
    public init(startAngle: Angle, endAngle: Angle, clockwise: Bool = true) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.clockwise = clockwise
    }
    
    public func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle, 
            clockwise: clockwise
        )
        p.addLine(to: center)
        return p
    }
}
