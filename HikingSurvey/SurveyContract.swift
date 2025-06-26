protocol SurveyViewDelegate: AnyObject {}

protocol SurveyViewProtocol: AnyObject {}

protocol SurveyPresenterProtocol: AnyObject {
    
    var viewModel: SurveyViewModel { get }
    
    func submitResponse()
}

protocol SurveyInteractorProtocol: AnyObject {
    
    func score(text: String) -> SurveyResponse
    func sampleResponses() -> [SurveyResponse]
}

protocol SurveyInteractorOutputProtocol: AnyObject {}

protocol SurveyRouterProtocol: AnyObject {}
