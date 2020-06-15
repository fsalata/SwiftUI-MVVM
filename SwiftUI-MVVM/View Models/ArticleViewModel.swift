//
//  ArticleViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Fábio Salata on 15/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation

class ArticleViewModel: Identifiable {
	let id = UUID()
	
	let article: Article
	
	init(article: Article) {
		self.article = article
	}
	
	var title: String {
		return self.article.title
	}
	
	var description: String {
		return self.article.description ?? ""
	}
}
