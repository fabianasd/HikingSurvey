import SwiftUI

@main
struct SurveyApp: App {
    var body: some Scene {
        WindowGroup {
            let interactor = SurveyInteractor()
            let presenter = SurveyPresenter(interactor: interactor)
            SurveyView(presenter: presenter)
        }
    }
}
