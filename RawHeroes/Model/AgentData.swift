//
//  AgentData.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/7/22.
//

import Foundation

struct AllData: Decodable {
    let data: [AgentData]
}

struct AgentData: Decodable {
// taking of serialized object(JSON) and transforms into in memory object - Decodable
// serialization represantation of in memory objects - Encodable
    let displayName: String
    let description: String
    let displayIcon: URL
   // let fullPortraitV2: URL
    //let role: AgentRole
    let abilities: [AgentAbilities]
    //extend this to get more data
}

struct AgentRole: Decodable {
    let displayName: String
}


struct AgentAbilities: Decodable {
    let slot: String
    let displayName: String
    let description: String
    let displayIcon: URL?
    
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
}


// data[0].role.displayName data[0].abilities[0].slot
// data[19].abilities[4].displayIcon

