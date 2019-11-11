//
//  WeatherViewModel.swift
//  NewsApp
//
//  Created by Arber Basha on 11.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import Foundation


class WeatherViewModel: ObservableObject{
    

    @Published var weathers: Weather?
    
    func fetchWeatherByCityId(id: Int){
        
        let apiUrl = "https://api.weatherbit.io/v2.0/current?key=31770982698645538b4d1776b4ac670d&city_id=\(id)"
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {return}
            if response.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do{
                        self.weathers = try JSONDecoder().decode(Weather.self, from: data)
                    }catch let err{
                        print("Error :\(err)")
                    }
                }
            }else{
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
        
    }

}
