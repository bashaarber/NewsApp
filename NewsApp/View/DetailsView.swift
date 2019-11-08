//
//  DetailsView.swift
//  NewsApp
//
//  Created by Arber Basha on 8.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
    
    var articles: Articles
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    Text(articles.title)
                        .font(.headline)
                        .padding()
                    WebImage(url: URL(string: articles.urlToImage ?? ""))
                    .onSuccess { image, cacheType in
                        // Success
                    }
                    .resizable() // Resizable like SwiftUI.Image
                    .placeholder {
                        Image(systemName: "photo") // Placeholder
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipped()
                    Text("\(articles.content ?? "")")
                        .font(.body)
                        .lineLimit(nil)
                        .padding(.leading,4)
                        .padding(.trailing,4)
                    HStack{
                        Text("\(articles.author ?? "")").font(.footnote)
                        Spacer()
                        Text("Published: \(self.parseTime(date: articles.publishedAt!) ?? "")").font(.caption)
                    }
                    .padding(.top)
                    .padding(.leading,4)
                    .padding(.trailing,4)
                    HStack(){
                        Button(action: {self.openUrl(url: self.articles.url ?? "")}, label: {Text(articles.url ?? "").font(.footnote).lineLimit(1).padding()})
                    }.padding(.top, 40)

                    Spacer()
                }
                       
            }.navigationBarTitle(articles.source?.name ?? "")
        }
    }
    
    func openUrl(url: String){
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
    func parseTime(date: String)-> (String){
        var publish = ""
        publish = String(date.prefix(10))
        return publish
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailsView(articles: Articles(id: UUID(), source: Source(id: "fox-news", name: "Fox News"), author: "Brie Stimson", title: "Families mourn victims killed in Mexico, say it’s like ‘Afghanistan 100 miles from US border’ - Fox News", description: "Families mourn victims killed in Mexico, say it’s like ‘Afghanistan 100 miles from US border’ - Fox News", url: "https://www.foxnews.com/world/families-of-9-americans-killed-in-mexico-ambush-urge-leaders-to-accept-trumps-offer-to-help-stamp-out-cartels", urlToImage: "https://media2.foxnews.com/BrightCove/694940094001/2019/11/06/694940094001_6101165449001_6101155452001-vs.jpg", publishedAt: "2019-11-08T10:50:47Z", content: "Outraged family members of the nine Americans killed in a drug cartel ambush in Mexico Monday reportedly urged the country's leaders to accept President Trump’s offer to help destroy the cartels as the first funerals were held Thursday.\r\n“We’re living like we… "))
    }
}
