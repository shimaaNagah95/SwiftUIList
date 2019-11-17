//
//  PlayerView.swift
//  SwiftUIListExample
//
//  Created by Shimaa Nagah on 11/17/19.
//  Copyright © 2019 Code95. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    var player:Player
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.9608820963, green: 0.9703957805, blue: 0.9703957805, alpha: 1)))
                .cornerRadius(8)
                .shadow(color: .gray, radius: 4)
            VStack {
                Spacer()
                Image(player.photo)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .scaledToFill()
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 4)
                Spacer()
                VStack {
                    Text("\(player.name)").font(.title).foregroundColor(.black).bold()
                    Text("Position: \(player.position)")
                    Text("Club: \(player.club)")
                    Text("Nationality: \(player.nationality)")
                }
                Spacer()
            }
        }.frame(width: 200, height: 250, alignment: .center).padding()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: Player(club: "Barcelona", id: "1", name: "Andres Iniesta", nationality: "Spain", photo: "Andres Iniesta", position: "Midfielder"))
    }
}
