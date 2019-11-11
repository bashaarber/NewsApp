//
//  WeatherDetailView.swift
//  NewsApp
//
//  Created by Arber Basha on 11.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherDetailView: View {
    
    var city: City
    
    @ObservedObject var weatherVM = WeatherViewModel()
    
    @State var decimalToInt: Int = 1
    
    var body: some View {
        VStack{
            Text(city.name)
                .font(.largeTitle)
            Image(weatherVM.weathers?.data[0].weather.icon ?? "c01d")
            Text(String(format: "%.1f", weatherVM.weathers?.data[0].temp ?? ""))
                .font(.title)
            Text(weatherVM.weathers?.data[0].weather.description ?? "")
                .font(.title)
                .padding()
            HStack{
                VStack{
                    Image(systemName: "sunrise.fill")
                    Text(weatherVM.weathers?.data[0].sunrise ?? "")
                }.padding(.leading,100)
                Spacer()
                VStack{
                    Image(systemName: "sunset.fill")
                    Text(weatherVM.weathers?.data[0].sunset ?? "")
                }.padding(.trailing, 100)
            }.padding()
            
            Text(weatherVM.weathers?.data[0].wind_cdir_full ?? "")
            
        }.onAppear(){
            self.weatherVM.fetchWeatherByCityId(id: self.city.cityId)
        }
    }
    
    
}

struct WeatherDetailView_Previews: PreviewProvider {


    static var previews: some View {
        WeatherDetailView(city: City(id: 1, name: "Prishtina", cityId: 786714, image: "prishtina"))
    }
}
