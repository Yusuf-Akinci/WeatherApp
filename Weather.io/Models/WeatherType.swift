//
//  WeatherType.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 10.07.25.
//

import Foundation
import UIKit
enum WeatherType{
    case sunny, clear, cloudy, rainy, windy, none
    
    init(_ description: String){
        switch description.lowercased(){
            case let str where str.contains("sun"): self = .sunny
            case let str where str.contains("clear"): self = .clear
            case let str where str.contains("cloud"): self = .cloudy
            case let str where str.contains("rain"): self = .rainy
            case let str where str.contains("wind"): self = .windy
            default: self = .none
        }
    }
    
    var icon: UIImage?{
        switch self {
        case .rainy: return UIImage(systemName: "cloud.rain.fill")
        case .sunny: return UIImage(systemName: "sun.max.fill")
        case .cloudy: return UIImage(systemName: "cloud.fill")
        case .windy: return UIImage(systemName: "wind.fill")
        case .clear: return UIImage(systemName: "moon.stars.fill")
        case .none: return nil
        }
    }
}
