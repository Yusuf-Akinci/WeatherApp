//
//  Api.swift
//  Weather.io
//
//  Created by Yusuf Akinci on 05.07.25.
//

import Foundation

class Api{
    static let shared = Api()
    private init() {}
    //Sample JSON
    
    func fetchSampleJson<T:Decodable>(_ type: T.Type, completion: @escaping (T?) -> Void){
        guard let path = Bundle.main.path(forResource: getNameOfRessource(type: type), ofType: "json")
        else {
            completion(nil)
            return
        }
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode(type, from: data)
            completion(decodedData)
        } catch {
            print(error)
            completion(nil)
        }
                
    }
    
    private func getNameOfRessource<T>(type: T.Type) -> String{
        if(type == CurrentWeatherData.self){
            return "CurrentWeather"
        }
        else if(type == WeeklyWeatherData.self){
            return "WeeklyForecast"
        }
        else {
            return ""
        }
    }

    //Live JSON
    func fetchLiveCurrentWeatherData(completion: @escaping (CurrentWeatherData?) -> Void){
        //CREATING URL
        let urlLink = "https://api.openweathermap.org/data/2.5/weather?lat=51.433334&lon=6.883333&appid=c18df1f3dd4cc48af1fdfbfd45fab5c2&units=metric&lang=tr"
        let url = URL(string: urlLink)!
        
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in guard error == nil, let data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CurrentWeatherData.self, from: data)
                completion(decodedData)
            } catch {
                print(error)
                completion(nil)
            }
        }
        task.resume()
        
    }
    
    func fetchLiveWeeklyWeatherData(completion: @escaping (WeeklyWeatherData?) -> Void){
        //CREATING URL
        let urlLink = "https://api.openweathermap.org/data/2.5/forecast?lat=51.433334&lon=6.883333&appid=c18df1f3dd4cc48af1fdfbfd45fab5c2&units=metric&lang=tr"
        let url = URL(string: urlLink)!
        
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in guard error == nil, let data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeeklyWeatherData.self, from: data)
                completion(decodedData)
            } catch {
                print(error)
                completion(nil)
            }
        }
        task.resume()
        
    }
}
