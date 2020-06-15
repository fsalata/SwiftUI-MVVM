//
//  ArticleListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Fábio Salata on 15/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation
import Combine

class ArticleListViewModel: ObservableObject {
	let didChange = PassthroughSubject<ArticleListViewModel,Never>()
	
	init() {
		fetchTopHeadlines()
	}
	
 	@Published var articles = [ArticleViewModel]() {
		didSet {
			didChange.send(self)
		}
	}
	
	private func fetchTopHeadlines() {
		guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=9f78b19e778d4c4ea40e20dcdd443495") else {
			fatalError("Incorrect URL")
		}
		
		Service().loadTopHeadlines(url: url) { articles in
			if let articles = articles {
				self.articles = articles.map(ArticleViewModel.init)
			}
		}
	}
	
}
