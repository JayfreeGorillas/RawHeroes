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
    let abilities: [AgentAbility]
    let isPlayableCharacter: Bool
}


struct AgentAbility: Decodable, Equatable {
    let slot: String
    let displayName: String
    let description: String
    let displayIcon: URL?
}
