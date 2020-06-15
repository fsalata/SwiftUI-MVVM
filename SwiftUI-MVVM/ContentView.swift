//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Fábio Salata on 15/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = ArticleListViewModel()
	
    var body: some View {
		NavigationView {
			List(viewModel.articles) { article in
				NavigationLink(destination: ArticleView(article: article)) {
					VStack(alignment: .leading) {
						Text(article.title)
							.lineLimit(nil)
						
						Spacer()
							.frame(height: 10)
						
						Text(article.description)
							.foregroundColor(.secondary)
							.lineLimit(nil)
					}
					.padding(.vertical, 5)
				}
			}
			.navigationBarTitle(Text("News"))
		}
    }
}

struct ArticleView: View {
	var article: ArticleViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(article.title)
				.font(.title)
				.lineLimit(nil)
			
			Spacer()
				.frame(height: 10)
			
			Text(article.description)
				.font(.body)
				.lineLimit(nil)
			
			Spacer()
		}
		.padding(16)
		.navigationBarTitle(Text("Article"))
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
