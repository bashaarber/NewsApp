//
//  RowView.swift
//  NewsApp
//
//  Created by Arber Basha on 7.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI


struct RowView: View {
    
    var article: Articles
    
    var body: some View {
        VStack{
            Text(article.title).font(.title).padding(.bottom)
            WebImage(url: URL(string: article.urlToImage ?? ""))
            .onSuccess { image, cacheType in
                // Success
            }
            .resizable() // Resizable like SwiftUI.Image
            .placeholder {
                Image(systemName: "photo") // Placeholder
            }.resizable()
            .scaledToFit()
            .frame(height: 300)
            .clipped()
            Text("\(article.description ?? "")")
                .font(.body)
                .padding(.bottom)
                .padding(.top)
            HStack{
                Text("Source: \(article.source?.name ?? "")").font(.footnote)
                Spacer()
                Text("Published: \(self.parseTime(date: article.publishedAt!) ?? "")").font(.caption)
            }.padding(.top)
        }
    }
    
    func parseTime(date: String)-> (String){
        var publish = ""
        publish = String(date.prefix(10))
        return publish
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(article: Articles(id: UUID(), source: Source(id: "fox-news", name: "Fox News"), author: "Brie Stimson", title: "Families mourn victims killed in Mexico, say it’s like ‘Afghanistan 100 miles from US border’ - Fox News", description: "Families mourn victims killed in Mexico, say it’s like ‘Afghanistan 100 miles from US border’ - Fox News", url: "https://www.foxnews.com/world/families-of-9-americans-killed-in-mexico-ambush-urge-leaders-to-accept-trumps-offer-to-help-stamp-out-cartels", urlToImage: "https://media2.foxnews.com/BrightCove/694940094001/2019/11/06/694940094001_6101165449001_6101155452001-vs.jpg", publishedAt: "2019-11-08T10:50:47Z", content: "Outraged family members of the nine Americans killed in a drug cartel ambush in Mexico Monday reportedly urged the country's leaders to accept President Trump’s offer to help destroy the cartels as the first funerals were held Thursday.\r\n“We’re living like we… "))
    }
}
