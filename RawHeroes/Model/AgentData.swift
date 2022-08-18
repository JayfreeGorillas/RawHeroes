import Foundation

struct AllData: Decodable {
    let data: [Agent]
}

struct Agent: Decodable {
    let displayName: String
    let description: String
    let displayIcon: URL
    let role: Role?
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

struct Role: Decodable {
    let displayName: String?
}
