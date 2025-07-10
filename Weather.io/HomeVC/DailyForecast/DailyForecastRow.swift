//
//  DailyForecastRow.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 04.07.25.
//

import UIKit

class DailyForecastRow: UITableViewCell {
    static let id: String = "DailyForecastRow"
    private var list: [WeeklyWeatherList] = []
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    private func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func configure(_ weatherData: WeeklyWeatherData?){
        guard let list = weatherData?.list else {return}
        self.list = list
        collectionView.reloadData()
    }

}

extension DailyForecastRow: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count > 0 ? 8 : list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyForecastCell.id, for: indexPath) as! DailyForecastCell
        let item = list[indexPath.item]
        cell.configure(item)
        return cell
    }
}

extension DailyForecastRow: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout /* It can be a grid, we want it to be horizontal */{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 140)
    }
}
