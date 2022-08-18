import Foundation

enum EndPoint: String {
    case allAgentsEndpoint = "/agents"
    case badges = "/badges"
}
struct AgentAPI {
    private static let baseURLString = "https://valorant-api.com/v1/agents"
    private static  func valorantURL(endPoint: EndPoint) -> URL {
        let components = URLComponents(string: baseURLString)!
        return components.url!
    }
    
    static var agentsURL: URL {
        valorantURL(endPoint: .allAgentsEndpoint)
    }
    
    
    static func agents(fromJSON data: Data) -> Result<[Agent], Error> {
        let decoder = JSONDecoder()
        do {
            let agentResponse = try decoder.decode(AllData.self, from: data)
            return .success(agentResponse.data)
        } catch {
            return .failure(error)
        }
    }
}
