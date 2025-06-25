import SwiftUI
import Charts

struct SurveyView: View {
    @ObservedObject var presenter: SurveyPresenter
    @State var responses: [SurveyResponse] = []
    
    var body: some View {
        Text("Ranking de opiniões")
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding(.top, 24)
        
        SentimentChartView(responses: presenter.viewModel.responses)
                 
        List(presenter.viewModel.responses) { response in
            HStack {
                Text(response.text)
                Spacer()
                Image(systemName: response.sentiment.icon)
                    .foregroundColor(Color(hex: response.sentiment.sentimentColor))
            }
        }
                 
        VStack(spacing: 16) {
            TextField("Digite sua opinião", text: $presenter.viewModel.inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Enviar") {
                presenter.submitResponse()
            }
            .disabled(!presenter.viewModel.isValid())
            .opacity(presenter.viewModel.isValid() ? 1.0 : 0.5)
        }
        
        .padding()
    }
}
