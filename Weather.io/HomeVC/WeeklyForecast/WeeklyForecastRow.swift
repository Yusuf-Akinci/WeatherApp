//
//  WeeklyForecastRow.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 04.07.25.
//

import UIKit

class WeeklyForecastRow: UITableViewCell {
    static let id: String = "WeeklyForecastRow"
    private var weeklyData: [DailyWeatherData] = []

    @IBOutlet private weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(_ weeklyWeatherModel: WeeklyWeatherData?){
        guard let list = weeklyWeatherModel?.list else { return }
        weeklyData = list.getDailyWeatherData()
        tableView.reloadData()
    }
    
}

extension WeeklyForecastRow: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hello")
        return weeklyData.count > 5 ? 5 : weeklyData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyForecastCell.id, for: indexPath) as! WeeklyForecastCell
        print("weekly cell succesfully created")
        cell.configure(dayData: weeklyData[indexPath.row])
        return cell
    }
}

extension WeeklyForecastRow: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
