//
//  WeatherFall2024App.swift
//  WeatherFall2024
//
//  Created by Vladimir Cezar on 2024-11-06.
//

import SwiftUI

@main
struct WeatherFall2024App: App {
  var body: some Scene {
    WindowGroup {
      WeatherView()
      WeatherViewAsync()
    }
  }
}
