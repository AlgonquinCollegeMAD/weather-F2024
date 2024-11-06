import Foundation

class WeatherService {
  let apiKey = ""
  let baseURL = "https://api.openweathermap.org/data/2.5/weather"
  
  func fetchWeather(for city: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
    let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)&units=metric"
    guard let url = URL(string: urlString) else {
      completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let data = data else {
        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
        return
      }
      
      do {
        let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
        completion(.success(weatherData))
      } catch let decodingError {
        completion(.failure(decodingError))
      }
    }
    task.resume()
  }
}
