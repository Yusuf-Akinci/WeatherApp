//
//  WeeklyForecastRow.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 04.07.25.
//

import UIKit

class WeeklyForecastRow: UITableViewCell {
    static let id: String = "WeeklyForecastRow"

    @IBOutlet private weak var tableView: UITableView!
    func configure(){
        
    }
    
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

}

extension WeeklyForecastRow: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hello")
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyForecastCell.id, for: indexPath) as! WeeklyForecastCell
        print("weekly cell succesfully created")
        return cell
    }
}

extension WeeklyForecastRow: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
