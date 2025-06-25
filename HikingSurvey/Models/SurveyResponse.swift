import Foundation

struct SurveyResponse: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var score: Double

    var sentiment: Sentiment {
        Sentiment(score)
    }
}
