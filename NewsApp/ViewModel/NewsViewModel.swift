//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Arber Basha on 7.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import Foundation

let apiUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=642dac9cf09646e1b088929191b2f96a"

class NewsViewModel: ObservableObject{
    
    @Published var news: News?
    @Published var articles: [Articles] = []
    
    func fetchNews(){
        
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
                        self.news = try JSONDecoder().decode(News.self, from: data)
                        print("Arber \(self.news)")
                        self.articles = self.news!.articles
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
