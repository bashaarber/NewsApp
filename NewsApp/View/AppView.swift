//
//  AppView.swift
//  NewsApp
//
//  Created by Arber Basha on 11.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem({
                    Image(systemName: "book")
                    Text("News")
            })
            WeatherView()
                .tabItem({
                    Image(systemName: "cloud.sun")
                    Text("Weather")
            })
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
