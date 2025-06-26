import Combine

class SurveyPresenter: ObservableObject {
    private var interactor: SurveyInteractorProtocol
    
    @Published var viewModel = SurveyViewModel()
    
    init(interactor: SurveyInteractorProtocol) {
        self.interactor = interactor
        self.viewModel.responses = interactor.sampleResponses()
    }
}

extension SurveyPresenter: SurveyPresenterProtocol {
    
    func submitResponse() {
        guard viewModel.isValid() else {
            print("Entrada inválida")
            return
        }
        
        let response = interactor.score(text: viewModel.inputText)
        viewModel.responses.insert(response, at: 0)
        viewModel.inputText = ""
    }
}
