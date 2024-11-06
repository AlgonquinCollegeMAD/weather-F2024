import SwiftUI

struct WeatherViewAsync: View {
  @StateObject var viewModel = WeatherViewModelAsync()
  
  var body: some View {
    VStack {
      TextField("Enter city name", text: $viewModel.city)
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      Button(action: {
        viewModel.fetchWeather()
      }) {
        Text("Get Weather")
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(8)
      }
      
      if let weatherData = viewModel.weatherData {
        Text("City: \(weatherData.name)")
        Text("Temperature: \(weatherData.main.temp)°C")
      } else if !viewModel.errorMessage.isEmpty {
        Text(viewModel.errorMessage)
          .foregroundColor(.red)
      }
    }
    .padding()
  }
}

#Preview {
  WeatherViewAsync()
}
