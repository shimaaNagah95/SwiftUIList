//
//  HorizontalView.swift
//  SwiftUIListExample
//
//  Created by Shimaa Nagah on 11/17/19.
//  Copyright © 2019 Code95. All rights reserved.
//

import SwiftUI

struct HorizontalView: View, SwiftUIListDelegate {
    func navigateToDestination(item: Any) -> AnyView {
        return AnyView(Text(""))
    }
    
    func displayView(item: Any) -> AnyView {
        let player = item as! Player
        return AnyView(PlayerView(player: player))
    }
    
    func loadMore() {}
    
    @ObservedObject var viewModel = PlayerViewModel()
    
    init() {
        self.viewModel.fetchPlayers(page: 1, per_page: 10)
    }
    
    var body: some View {
        VStack {
            SwiftUIList(scrollDirection: .horizontal,showIndicator:false, specingBetweenItems: CGFloat(0), data: viewModel.players, delegate: self)
        }
    }
}

struct HorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalView()
    }
}
