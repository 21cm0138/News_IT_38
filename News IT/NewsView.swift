//
//  NewsView.swift
//  ITnews
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct NewsView: View {
    
    var title:String
    //var link:String
    var pubDate:String
    var image:UIImage
    var description:String
    
    var body: some View {
        VStack{
            
            HStack{
                Image(uiImage: image)
                    .resizable()//图像自动调整大小
                    .aspectRatio(contentMode: .fit)//保持比例大小
                    .frame(width: 80, height: 60, alignment: .center)
                
                VStack{
                    Text(title)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 19))
                        .lineLimit(2)
                    
                    HStack{
                        Spacer()
                        Text(pubDate)
                            .font(.system(size: 11))
                            .foregroundColor(Color.gray)
                            .background(Color.white)
                    }
                }
                
                
            }
            
        }
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}
