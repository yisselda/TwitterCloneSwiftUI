//
//  SearchTweetsView.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/2/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine
import SwiftUI

struct SearchTweetsView: View {

    @Environment(\.imageCache) var cache: ImageCache
    @ObservedObject private var viewModel: SearchTweetsViewModel
    
    init(viewModel: SearchTweetsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    tweetSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Twitter 💙")
        }
    }
}

extension SearchTweetsView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("Search Tweets", text: $viewModel.searchText)
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    
    var tweetSection: some View {
        Section {
            ForEach(viewModel.dataSource) { rowViewModel in
                TweetRow(imageCache: self.cache, viewModel: rowViewModel)
            }
        }
    }
}

struct SearchTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        let mockService = MockTwitterService()
        let viewModel = SearchTweetsViewModel(twitterService: mockService)
        viewModel.searchText = "Kodak Black"
        viewModel.dataSource = [.preview]
        return SearchTweetsView(viewModel: viewModel)
    }
}
