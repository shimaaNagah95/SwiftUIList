//
//  PlayerViewModel.swift
//  SwiftUIListExample
//
//  Created by Shimaa Nagah on 11/17/19.
//  Copyright © 2019 Code95. All rights reserved.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    private var allPlayers:[Player] = Bundle.main.decode([Player].self, from: "Players.json")
    @Published var players:[Player] = []
    
    func fetchPlayers(page:Int, per_page:Int) {
        var maximum = ((page * per_page) + per_page) - 1
        let start = page * per_page

        if maximum >= allPlayers.count {
            maximum = allPlayers.count - 1
        }
        
        if start < allPlayers.count {
            let moreItems = Array(allPlayers[start...maximum])
            players += moreItems
        }

    }
}
