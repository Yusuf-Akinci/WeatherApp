//
//  WeeklyForecastCell.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 05.07.25.
//

import UIKit

class WeeklyForecastCell: UITableViewCell {
    static let id = "WeeklyForecastCell"
    
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var tempMaxLabel: UILabel!
    @IBOutlet private weak var tempMinLabel: UILabel!
    @IBOutlet private weak var statusImg: UIImageView!
    @IBOutlet private weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(dayData: DailyWeatherData){
        dayLabel.text = dayData.day
        tempMinLabel.text = "\(Int(dayData.lows.average()))"
        tempMaxLabel.text = "\(Int(dayData.highs.average()))"
        setSlider(dayData: dayData)
        
        if let description = dayData.description{
            let weather = WeatherType(description)
            statusImg.image = weather.icon
        } else {
            statusImg.image = nil
        }
    }
    private func setSlider(dayData: DailyWeatherData){
        let low = dayData.lows.average()
        let high = dayData.highs.average()
        slider.minimumValue = Float(low)
        slider.maximumValue = Float(high)
        slider.value = Float(dayData.average)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
