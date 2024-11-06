import Foundation

struct WeatherData: Codable {
  let main: Main
  let name: String
}

struct Main: Codable {
  let temp: Double
}
