//
//  DailyForecastCell.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 05.07.25.
//

import UIKit

class DailyForecastCell: UICollectionViewCell {
    static let id = "DailyForecastCell"
    
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var statusImg: UIImageView!
    func configure(_ item: WeeklyWeatherList){
        guard let unwrappedText = item.dt_txt else { return }
        print(item.dt_txt ?? 0)
        timeLabel.text = "\(item.dt_txt ?? "")"
        tempLabel.text = "\(Int(item.main?.temp ?? 0))°"
        
    }

}
