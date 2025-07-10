//
//  DailyWeatherData.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 09.07.25.
//
import UIKit
 
struct DailyWeatherData{
    let description: String?
    let day: String
    var lows: [Double] = []
    var highs: [Double] = []
    var average: Double { return lows.average() + highs.average() / 2}
}
