import SwiftUI

class WeatherViewModelAsync: ObservableObject {
  @Published var weatherData: WeatherData?
  @Published var city: String = ""
  @Published var errorMessage: String = ""
  
  private var weatherService = WeatherServiceAsync()
  
  func fetchWeather() {
    Task {
      do {
        let data = try await weatherService.fetchWeather(for: city)
        DispatchQueue.main.async {
          self.weatherData = data
        }
      } catch {
        DispatchQueue.main.async {
          self.errorMessage = error.localizedDescription
        }
      }
    }
  }
}
