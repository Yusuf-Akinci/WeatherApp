//
//  CurrentWeatherRow.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 04.07.25.
//

import UIKit

class CurrentWeatherRow: UITableViewCell {
    static let id: String = "CurrentWeatherRow"
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var timeIcon: UIImageView!
    @IBOutlet private weak var currentTempLabel: UILabel!
    @IBOutlet private weak var currentStatusLabel: UILabel!
    @IBOutlet private weak var highestTempLabel: UILabel!
    @IBOutlet private weak var lowestTempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        timeIcon.alpha = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(_ weather: CurrentWeatherData?){
        guard let weather else { return }
        currentTempLabel.text = "\(Int(weather.main.temp))°"
        cityLabel.text = weather.name
        currentStatusLabel.text = weather.weather.first?.description
        lowestTempLabel.text = "Y: \(Int(weather.main.temp_min))°"
        highestTempLabel.text = "D: \(Int(weather.main.temp_max))°"
    }

}
