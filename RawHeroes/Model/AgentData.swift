//
//  AgentData.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/7/22.
//

import Foundation

struct AllData: Decodable {
    let data: [Agent]
}

struct Agent: Decodable {
// taking of serialized object(JSON) and transforms into in memory object - Decodable
// serialization represantation of in memory objects - Encodable
    let displayName: String
    let description: String
    let displayIcon: URL
   // let fullPortraitV2: URL
    //let role: AgentRole
    let abilities: [AgentAbility]
    //extend this to get more data
}

//struct AgentRole: Decodable {
//    let displayName: String
//}


struct AgentAbility: Decodable, Equatable {
    let slot: String
    let displayName: String
    let description: String
    let displayIcon: URL?
}


// data[0].role.displayName data[0].abilities[0].slot
// data[19].abilities[4].displayIcon
// Equatable example for comparing agent abilities on slot name only
//  static func == (lhs: AgentAbilities, rhs: AgentAbilities) -> Bool {
//
//      return lhs.slot == rhs.slot
//    }
//    init(from decoder: Decoder) throws {
//        dsds
//    }
