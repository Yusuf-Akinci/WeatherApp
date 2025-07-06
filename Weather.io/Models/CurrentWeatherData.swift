//
//  CurrentWeatherData.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 05.07.25.
//
import Foundation
struct CurrentWeatherData: Decodable{
    let coord: CWCoordinates
    let weather: [CWWeather]
    let base: String
    let main: CWMain
    let visibility: Int
    let wind: CWWind
    let clouds: CWClouds
    let dt: Int
    let sys: CWSys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}
struct CWCoordinates: Decodable{
    let lon: Double
    let lat: Double
}

struct CWWeather: Decodable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CWMain: Decodable{
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct CWWind: Decodable{
    let speed: Double
    let deg: Int
}

struct CWClouds: Decodable{
    let all: Int
}

struct CWSys: Decodable{
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

