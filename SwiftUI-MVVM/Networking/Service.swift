//
//  Service.swift
//  SwiftUI-MVVM
//
//  Created by Fábio Salata on 15/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation

class Service {
	func loadTopHeadlines(url: URL, completion: @escaping ([Article]?) -> Void) {
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				completion(nil)
				return
			}
			
			let response = try? JSONDecoder().decode(NewsResponse.self, from: data)
			
			if let response = response {
				DispatchQueue.main.async {
					completion(response.articles)
				}
			}
		}.resume()
	}
}
