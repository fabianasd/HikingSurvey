protocol SurveyScreenDelegate: AnyObject {
    
    func didUpdateText(_ text: String)
    func didSubmitResponse()
}

protocol SurveyViewProtocol: AnyObject {
    
    func formValidated(_ valid: Bool)
    func showInvalidInputToast()
}

protocol SurveyPresenterProtocol: AnyObject {
    
    var viewModel: SurveyViewModel { get }
    
    func submitResponse()
    func setInput(_ text: String)
}

protocol SurveyInteractorProtocol: AnyObject {
    
    func score(text: String) -> SurveyResponse
    func sampleResponses() -> [SurveyResponse]
}

protocol SurveyInteractorOutputProtocol: AnyObject {}

protocol SurveyRouterProtocol: AnyObject {
    
    func closeSurvey()
}
