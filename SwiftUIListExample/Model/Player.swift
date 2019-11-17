//
//  Player.swift
//  SwiftUIListExample
//
//  Created by Shimaa Nagah on 11/17/19.
//  Copyright © 2019 Code95. All rights reserved.
//

import Foundation

struct Player : Codable, Hashable {

    let club : String!
    let id : String!
    let name : String!
    let nationality : String!
    let photo : String!
    let position : String!

    enum CodingKeys: String, CodingKey {
        case club = "club"
        case id = "id"
        case name = "name"
        case nationality = "nationality"
        case photo = "photo"
        case position = "position"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        club = try values.decodeIfPresent(String.self, forKey: .club)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
        photo = try values.decodeIfPresent(String.self, forKey: .photo)
        position = try values.decodeIfPresent(String.self, forKey: .position)
    }

    init(club: String, id: String, name: String, nationality: String, photo: String, position: String) {
        self.club = club
        self.id = id
        self.name = name
        self.nationality = nationality
        self.photo = photo
        self.position = position
    }
}

