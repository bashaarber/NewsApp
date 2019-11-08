//
//  ContentView.swift
//  NewsApp
//
//  Created by Arber Basha on 4.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newsVM = NewsViewModel()

    init(){
       UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView{
            List(newsVM.articles, id: \.title){ art in
                NavigationLink(destination: DetailsView(articles: art)){
                                RowView(article: art)
                }
                }.navigationBarTitle("News")
                .navigationBarItems(trailing: Button(action: {self.newsVM.fetchNews()}, label: {Text("Refesh")}))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
