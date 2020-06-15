//
//  Models.swift
//  SwiftUI-MVVM
//
//  Created by Fábio Salata on 15/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
	let articles: [Article]
}

struct Article: Codable {
	let title: String
	let description: String?
}
