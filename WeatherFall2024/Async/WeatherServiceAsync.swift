import Foundation

class WeatherServiceAsync {
  let apiKey = "b2ad6dba61ae28dee3ccd35ebecc4c71"
  let baseURL = "https://api.openweathermap.org/data/2.5/weather"
  
  func fetchWeather(for city: String) async throws -> WeatherData {
    let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)&units=metric"
    guard let url = URL(string: urlString) else {
      throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
    return weatherData
  }
}
