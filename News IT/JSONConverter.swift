//
//  JSONConverter.swift
//  ITnews
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

//设置链接并获取Json
class JSONConverter {
    
    
    
    let req_url:URL
    //定义URL内容
    init(){
        req_url = URL(string:"https://evangelion.cn/getjson/")!
    }
    
    //根据url获取返回的JSON
    func resume(handler: @escaping (Data?, URLResponse?, Error?) -> ()){
        
        let request = URLRequest(url: req_url)
        //let session = URLSession(configuration: .default,delegate: nil, delegateQueue: OperationQueue.main)
        let task = URLSession.shared.dataTask(with: request, completionHandler: handler)
        task.resume()
        
    }
    
}
