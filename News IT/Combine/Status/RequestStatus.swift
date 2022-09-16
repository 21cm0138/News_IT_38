//
//  RequestStatus.swift
//  News IT
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

/// ステータス管理用のenum
enum RequestStatus {
    case unexecuted         // 未実行
    case success            // 成功
    case midway             // 途中
    case failed(Error)      // 失敗
}
