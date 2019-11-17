//
//  VerticalView.swift
//  SwiftUIListExample
//
//  Created by Shimaa Nagah on 11/12/19.
//  Copyright © 2019 Code95. All rights reserved.
//

import SwiftUI
import SwiftUIList

struct VerticalView: View, SwiftUIListDelegate {
    func navigateToDestination(item: Any) -> AnyView {
        return AnyView(Text(""))
    }
    
    func displayView(item: Any) -> AnyView {
        let player = item as! Player
        return AnyView(PlayerView(player: player))
    }
    
    func loadMore() {
        dataIsLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.dataIsLoading = false
            self.page = self.page + 1
            self.viewModel.fetchPlayers(page: self.page, per_page: 10)
        }
    }
    
    @ObservedObject var viewModel = PlayerViewModel()
    @State var page = 1
    @State var dataIsLoading = false
    
    init() {
        self.viewModel.fetchPlayers(page: page, per_page: 10)
    }
    
    var body: some View {
        VStack {
            SwiftUIList(scrollDirection: .vertical, showIndicator: true, specingBetweenItems: CGFloat(8), data: viewModel.players, delegate: self)
                ActivityIndicator(isAnimating: $dataIsLoading, style: .large)
        }
    }
}

struct VerticalView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalView()
    }
}
