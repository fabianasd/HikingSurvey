struct SurveyViewModel: Equatable {
    
    var inputText: String = ""
    var responses: [SurveyResponse] = []

    func isValid() -> Bool {
        !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
