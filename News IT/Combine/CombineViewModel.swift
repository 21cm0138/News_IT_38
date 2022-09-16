//
//  CombineViewModel.swift
//  News IT
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI
import Combine



final class CombineViewModel: ObservableObject {
    private(set) var images: [News] = []
    @Published var status: RequestStatus
    
    let newsSubject: PassthroughSubject<Void, Never>
    let imageSubject: PassthroughSubject<Void, Never>
    let combine: CombineModle<NewsResponse>
    var cancellable: Set<AnyCancellable>
    
    init() {
        status = .unexecuted
        newsSubject = PassthroughSubject()
        imageSubject = PassthroughSubject()
        combine = CombineModle()
        cancellable = []
        try? settings()
    }
    
    func settings() throws{
        
    }
}


