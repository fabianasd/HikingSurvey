import NaturalLanguage

class SurveyInteractor {
    weak var output: SurveyInteractorOutputProtocol?
}

extension SurveyInteractor: SurveyInteractorProtocol {
    func score(text: String) -> SurveyResponse {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        var sentimentScore = 0.0
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph,
            scheme: .sentimentScore,
            options: []
        ) { tag, _ in
            if let raw = tag?.rawValue, let value = Double(raw) {
                sentimentScore = value
                return true
            }
            return false
        }
        return SurveyResponse(text: text, score: sentimentScore)
    }

    func sampleResponses() -> [SurveyResponse] {
        [
            "A vida ao ar livre é o meu lugar feliz, então me dê uma trilha e botas e eu me sinto ótimo!",
            "Não me importo de caminhar, mas fazer trilhas exige muito equipamento e planejamento.",
            "Caminhar parece uma ótima maneira de manter a forma.",
            "Adoro tudo sobre trilhas: o ar fresco, o exercício, a sensação de realização. Quando podemos ir de novo?",
            "Há uma trilha pavimentada perto da minha casa que eu gosto, mas não preciso sair para a mata.",
            "Gosto de caminhadas difíceis. Quando meu coração está batendo forte e estou sendo desafiado, me sinto ótimo.",
            "Da última vez que fiz trilhas, levei mil picadas de inseto. Você não vai me encontrar em uma trilha tão cedo!"
        ].map { score(text: $0) }
    }
}
