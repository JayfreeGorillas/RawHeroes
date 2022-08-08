import Foundation

struct AllData: Decodable {
    let data: [Agent]
}

struct Agent: Decodable {

    let displayName: String
    let description: String
    let displayIcon: URL
    //data[0].fullPortraitV2
    let fullPortraitV2: URL?
    let abilities: [AgentAbility]
    let isPlayableCharacter: Bool
}


struct AgentAbility: Decodable, Equatable {
    let slot: String
    let displayName: String
    let description: String
    let displayIcon: URL?
}
