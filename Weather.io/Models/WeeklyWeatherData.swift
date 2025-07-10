//
//  WeeklyWeatherData.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 05.07.25.
//

import Foundation

struct WeeklyWeatherData: Decodable{
    let cod: String
    let message: Int
    let cnt: Int
    let list: [WeeklyWeatherList]
}
struct WeeklyWeatherList: Decodable{
    let dt: Int?
    let main: WWMain?
    let weather: [WWWeather]?
    let clouds: WWClouds?
    let wind: WWWind?
    let visibility: Int?
    let pop: Double?
    let sys: WWSys?
    let dt_txt: String?
}
struct WWMain: Decodable{
    let temp: Double?
        let feelsLike: Double?
        let tempMin: Double?
        let tempMax: Double?
        let pressure: Int?
        let seaLevel: Int?
        let groundLevel: Int?
        let humidity: Int?
        let tempKf: Double?
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case seaLevel = "sea_level"
            case groundLevel = "grnd_level"
            case tempKf = "temp_kf"
        }
}

struct WWWeather: Decodable{
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct WWClouds: Decodable{
    let all: Int?
}

struct WWWind: Decodable{
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct WWSys: Decodable{
    let pod: String?
}

struct WWCity: Decodable {
    let id: Int?
    let name: String?
    //let coord: Coordinates?
    let country: String?
    let population: Int?
    let timezone: Int?
    let sunrise: Int?
    let sunset: Int?
}
