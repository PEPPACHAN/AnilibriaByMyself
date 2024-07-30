//
//  JsonDecoderSrtuctures.swift
//  AnilibriaByMyself
//
//  Created by PEPPA CHAN on 03.07.2024.
//

import Foundation

struct TitleUpdatesNames: Decodable {
    let ru: String
}

struct TitleUpdates: Decodable {
    let id: Int
    let code: String
    let names: TitleUpdatesNames
}

struct ListTitleUpdates: Decodable {
    let list: TitleUpdates
}
