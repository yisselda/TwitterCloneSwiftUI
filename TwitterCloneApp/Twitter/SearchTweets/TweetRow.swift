//
//  TweetRow.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import SwiftUI

struct TweetRow: View {
    private let viewModel: TweetRowViewModel
    
    init(viewModel: TweetRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("twitter_default_profile_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40.0, height: 40.0)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(viewModel.name)
                        .bold()
                    Text(viewModel.screenName)
                        .font(.caption)
                }
                Spacer()
                Image("Twitter_Logo_Blue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(8)
            HStack {
                Text(viewModel.content)
                    .font(.body)
                    .bold()
            }
            .padding(8)
        }
    }
}


struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        TweetRow(viewModel: .preview)
    }
}
