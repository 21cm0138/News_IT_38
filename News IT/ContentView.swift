//
//  ContentView.swift
//  News IT
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI
import Combine


struct ContentView: View {
    @StateObject var dataLoader = DataLoader()
    
    var body: some View {
        
        
        //https://news.yahoo.co.jp/rss/topics/it.xml
        //https://news.yahoo.co.jp/rss/categories/it.xml
        
        VStack {
            VStack {
                VStack{
                    List(dataLoader.newsModels){ newsModel in
                        
                        VStack{
                            
                            NewsView(title: newsModel.title,
                                     pubDate: newsModel.pubDate,
                                     image: newsModel.image,
                                     description: newsModel.description)
                        }
                    }
                    
                }
                .background(Color.green)
                
                
            }
            HStack{
                Button{
                    dataLoader.getJsonData()
                    print("get Json finished")
                }label: {
                    Text("更新")
                        .padding([.top, .leading, .bottom], 5.0)
                        .frame(width: 120.0, height: 40.0, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                Spacer()
                Button {
                    dataLoader.updateImages = false
                    dataLoader.newsModels = []
                }label: {
                    Text("削除")
                        .frame(width: 120.0, height: 40.0, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
            }
            

            
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

