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
       //UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: . leading){
                
                
                    ScrollView(.horizontal){
                        VStack (alignment: .leading){
                            HStack{
                                Button(action: {self.newsVM.fetchCategoryNews(category: "sports")}, label: {Text("Sport")})
                                    .frame(width: 120, height: 110)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                Button(action: {self.newsVM.fetchCategoryNews(category: "entertainment")}, label: {Text("Entertaiment")})
                                    .frame(width: 120, height: 110)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                Button(action: {self.newsVM.fetchCategoryNews(category: "technology")}, label: {Text("Technology")})
                                    .frame(width: 120, height: 110)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                Button(action: {self.newsVM.fetchCategoryNews(category: "health")}, label: {Text("Health")})
                                    .frame(width: 120, height: 110)
                                    .background(Color.purple)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                Button(action: {self.newsVM.fetchCategoryNews(category: "business")}, label: {Text("Business")})
                                .frame(width: 120, height: 110)
                                .background(Color.yellow)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                        .frame(height: 200)
                        .padding()
                     }
                
                List(newsVM.articles, id: \.title){ art in
                    NavigationLink(destination: DetailsView(articles: art)){
                            RowView(article: art)
                           }
                        }.navigationBarTitle("News")
                        .navigationBarItems(trailing: Button(action: {self.newsVM.fetchNews()}, label: {Image(systemName: "arrow.counterclockwise")}))
                   }
            }.onAppear(){
                self.newsVM.fetchNews()
            }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
