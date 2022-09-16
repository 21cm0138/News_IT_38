//
//  DataLoader.swift
//  ITnews
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI
import Combine


class DataLoader: ObservableObject {
    
    // この値に変更があったら更新する

    
    @Published var newsModels:[NewsModel]

    var models:[NewsModel]
    
    var cancelable: Set<AnyCancellable> = .init()
    
    let noImage:UIImage = UIImage(named: "noImage")!
    
    @Published var updateImages:Bool = false
    init() {
        newsModels = []
        models = []
        $updateImages
            .sink{ value in
                print("updateImages = \(value)")
                if(value){
                    
                    print("----------")
                    DispatchQueue.main.async {
                        print("start update Images")
                        
                        var i = 0
                        for newsModel in self.newsModels {
                            print("get photo \(i)")
                            guard let imageUrl = URL(string: newsModel.imageURL) else{
                                print("Not A Url")
                                return
                            }
                            DispatchQueue.global(qos: .default).async {
                                
                                let image = ImageManager.uiImage(from: imageUrl)
                                DispatchQueue.main.sync {
                                    if(!self.newsModels.isEmpty){
                                        self.newsModels[i].setImage(image: image)
                                    }
                                }
                                
                                i += 1
                            }
                        }
                        self.updateImages = false
                        print("----------")
                    }
                }else{
                    print("updateImages = \(value)")
                    print("updateImages = -------------------")
                    print("----------")
                }
            }
            .store(in: &cancelable)
    }
    
    
    func getJsonData(){
        let jsonConverter = JSONConverter()
        jsonConverter.resume{ data, response, error in
            
            //检查错误
            if(error != nil){
                print("getJsonData Error")
            }
            //检查页面返回正常代码 200-399
            guard let response = response as? HTTPURLResponse,
                  (200...399).contains(response.statusCode) else {
                print("Response Error")
                return
            }
            //JSON处理
            do{
                let decoder = JSONDecoder()
                //print(String(data: data!, encoding: .utf8)!)
                let json_news = try decoder.decode(Welcome.self, from: data!)
                //DispatchQueue.main.async {}
                self.models = []
                for item in json_news.channel.item {
                    self.models.append(NewsModel(title: item.title,
                                                 pubDate: item.pubDate,
                                                 imageURL: item.image,
                                                 image: self.noImage,
                                                 description: item.itemDescription))
                }
                DispatchQueue.main.async {
                    self.newsModels = self.models
                    self.updateImages = true
                }
                
            }catch{
                print(error)
                print("getJsonData Catch")
            }
            
            
            
            
        }
        
    }
    
}
