//
//  AgentAPI.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/9/22.
//

import Foundation

enum EndPoint: String {
    // MARK:- Ask for help on endpoints for url
    case allAgentsEndpoint = "/agents"
    case badges = "/badges"
}
struct AgentAPI {
  private static let baseURLString = "https://valorant-api.com/v1/agents"
    
  private static  func valorantURL(endPoint: EndPoint) -> URL {
        var components = URLComponents(string: baseURLString)!
        
        
     
        return components.url!
    }
    
    static var agentsURL: URL {
        
        return valorantURL(endPoint: .allAgentsEndpoint)
    }
    
    
    static func agents(fromJSON data: Data) -> Result<[AgentData], Error> {
        let decoder = JSONDecoder()
        do {
    
            let agentResponse = try decoder.decode(AllData.self, from: data)
            
            return .success(agentResponse.data)
        } catch {
            return .failure(error)
        }
    }
    
}
