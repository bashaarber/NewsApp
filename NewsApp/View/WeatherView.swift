//
//  WeatherView.swift
//  NewsApp
//
//  Created by Arber Basha on 11.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    let cities: [City] = [
        City(id: 1, name: "Prishtina", cityId: 786714, image: "prishtina"),
        City(id: 2, name: "Gjilan", cityId: 790674, image: "gjilan"),
        City(id: 3, name: "Ferizaj", cityId: 784759, image: "ferizaj"),
        City(id: 4, name: "Prizeren", cityId: 786712, image: "prizeren"),
        City(id: 5, name: "Peje", cityId: 787157, image: "peje"),
        City(id: 6, name: "Mitrovice", cityId: 789225, image: "mitrovice"),
        City(id: 7, name: "Kamenice", cityId: 789227, image: "kamenic")
    ]
    
    @State private var show_modal: Bool = false
    
    init(){
          UITableView.appearance().separatorStyle = .none
       }
    
    var body: some View {
        NavigationView{
            List(cities){ city in
                Button(action: {self.show_modal = true}, label: {
                    ZStack{
                        Image(city.image)
                            .renderingMode(.original)
                            .resizable()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                        Text(city.name)
                            .foregroundColor(.white)
                            .bold()
                            .font(.largeTitle)
                    }
                }).sheet(isPresented: self.$show_modal) {
                    WeatherDetailView(city: city)
                }
            }.navigationBarTitle("Weather")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
