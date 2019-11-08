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
            }
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .clipped()
            Text("\(article.description ?? "")")
                .font(.body)
                .padding(.bottom)
                .padding(.top)
            HStack{
                Text("Source: \(article.source?.name ?? "")").font(.footnote)
                Spacer()
                Text("Published: \(article.publishedAt ?? "")").font(.caption)
            }.padding(.top)
        }
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
