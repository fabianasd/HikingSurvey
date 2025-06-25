import Foundation
import SwiftUI
import Charts

enum Sentiment: String, CaseIterable {
    case positive = "Positive"
    case negative = "Negative"
    case moderate = "Moderate"

    init(_ score: Double) {
        if score > 0.2 {
            self = .positive
        } else if score < -0.2 {
            self = .negative
        } else {
            self = .moderate
        }
    }

    var icon: String {
        switch self {
        case .positive: return "chevron.up"
        case .negative: return "chevron.down"
        case .moderate: return "minus"
        }
    }

    var sentimentColor: String {
        switch self {
        case .positive: return "#FD7E14"
        case .negative: return "#153865"
        case .moderate: return "#00717D"
        }
    }
}
