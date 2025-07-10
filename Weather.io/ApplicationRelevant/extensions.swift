//
//  extensions.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 09.07.25.
//

import Foundation
 
extension [Double] {
    func average () -> Double {
        var total: Double = 0
        var count: Double = 0
        for number in self {
            total += number
            count += 1
        }
        return total / count
    }
}

extension Int{
    func toDay() -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        return date.formatted(Date.FormatStyle().weekday(.abbreviated))
    }
    
    func toHour() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("h:mm")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let date = Date(timeIntervalSince1970: Double(self))
        return formatter.string(from: date)
    }
}

extension [WeeklyWeatherList] {
    func getDailyWeatherData() -> [DailyWeatherData]{
        var dailyWeatherModels: [DailyWeatherData] = []
        for item in self {
            guard let currentDay = item.dt?.toDay(),
                    let low = item.main?.tempMin,
                    let high = item.main?.tempMax
            else { continue }
            guard dailyWeatherModels.count > 0 else {
                let newDay = creatingNewDay(item)
                dailyWeatherModels.append(newDay)
                continue
            }
            if dailyWeatherModels.last?.day == currentDay {
                let j = dailyWeatherModels.count - 1 // letzte Position im Array
                dailyWeatherModels[j].lows.append(low)
                dailyWeatherModels[j].highs.append(high)
            } else {
                let newDay = creatingNewDay(item)
                dailyWeatherModels.append(newDay)
            }
        }
        return dailyWeatherModels
    }
    private func creatingNewDay(_ item: WeeklyWeatherList) -> DailyWeatherData {
        var dailyWeatherModel = DailyWeatherData(description: item.weather!.first?.main, day: item.dt!.toDay())
        dailyWeatherModel.lows.append(item.main!.tempMin!)
        dailyWeatherModel.highs.append(item.main!.tempMax!)
        return dailyWeatherModel
    }
}

