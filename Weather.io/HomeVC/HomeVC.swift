import UIKit

class HomeVC: UIViewController {
    private var currentWeather: CurrentWeatherData?
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchWeatherData()
    }
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func fetchWeatherData(){
//        Api.shared.fetchLiveCurrentWeatherData { [weak self] weather in
//            guard let weather else { return }
//            print(weather)
//            DispatchQueue.main.async {
//                self?.currentWeather = weather
//                self?.tableView.reloadData()
//            }
//        }

        Api.shared.fetchSampleJson(CurrentWeatherData.self) { currentWeather in
            guard let currentWeather else {return}
            print("weather: \(currentWeather)")
            
        }
        Api.shared.fetchSampleJson(WeeklyWeatherData.self) { weeklyWeather in
            guard let weeklyWeather else {return}
            print("weeklyWeather: \(weeklyWeather)")
        }
    }
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
            case 0: return createCell(indexPath: indexPath, id: "CurrentWeatherRow")
            case 1: return createCell(indexPath: indexPath, id: "DailyForecastRow")
            case 2: return createCell(indexPath: indexPath, id: "WeeklyForecastRow")
            default:return UITableViewCell()
        }
    }
    func createCell(indexPath: IndexPath, id: String) -> UITableViewCell{
        if(id == CurrentWeatherRow.id){
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentWeatherRow.id, for: indexPath) as! CurrentWeatherRow
            cell.configure(currentWeather)
            return cell
        }
        else if(id == DailyForecastRow.id){
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastRow.id, for: indexPath) as! DailyForecastRow
            return cell
        }
        else if (id == WeeklyForecastRow.id){
            let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyForecastRow.id, for: indexPath) as! WeeklyForecastRow
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0: return 300
            case 1: return 200
            case 2: return 250
            default: return 0
        }
    }
}
