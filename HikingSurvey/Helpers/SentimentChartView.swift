import SwiftUI
import Charts

struct SentimentChartView: View {
    
    var responses: [SurveyResponse]
    
    private var grouped: [(sentiment: Sentiment, total: Double)] {
        let grouped = Dictionary(grouping: responses, by: \.sentiment)
        return grouped.map { (sentiment, group) in
            (sentiment, group.map { $0.score }.reduce(0, +))
        }
    }
    
    private var total: Double {
        grouped.map { $0.total }.reduce(0, +)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let lineWidth = radius * 0.4
            
            ZStack {
                ForEach(Array(grouped.enumerated()), id: \.1.sentiment) { index, group in
                    let startAngle = angle(at: index)
                    let endAngle = angle(at: index + 1)
                    
                    Path { path in
                        path.addArc(center: center,
                                    radius: radius - lineWidth / 2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: false)
                    }
                    .stroke(Color(hex: group.sentiment.sentimentColor), lineWidth: lineWidth)
                }
                
                Image(systemName: "figure.hiking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: radius * 0.5)
                    .foregroundColor(.gray)
                    .position(center)
            }
        }
        .frame(height: 200)
        .padding()
    }
    
    private func angle(at index: Int) -> Angle {
        let value = grouped.prefix(index).map { $0.total }.reduce(0, +)
        return .degrees((value / total) * 360 - 90)
    }
}
