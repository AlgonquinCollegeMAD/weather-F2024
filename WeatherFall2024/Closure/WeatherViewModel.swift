import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
  @Published var weatherData: WeatherData?
  @Published var city: String = ""
  @Published var errorMessage: String = ""
  
  private var weatherService = WeatherService()
  
  func fetchWeather() {
    weatherService.fetchWeather(for: city) { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let data):
          self?.weatherData = data
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
        }
      }
    }
  }
}
