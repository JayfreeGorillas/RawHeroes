//
//  AgentAPI.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/9/22.
//

import Foundation
var agentList = [Agents]()
//var agentAbilities = [(String, String)]()

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
    
    
    static func agents(fromJSON data: Data) -> Result<[Agents], Error> {
        let decoder = JSONDecoder()
        do {
    
            let agentResponse = try decoder.decode(AllData.self, from: data)
            
            for agent in agentResponse.data {
                let displayName         = agent.displayName
                let description         = agent.description
                let display             = agent.displayIcon
                let slot1Name           = agent.abilities[0].displayName
                let slot1Descriptin     = agent.abilities[0].description
                let slot2Name           = agent.abilities[1].displayName
                let slot2Description    = agent.abilities[1].description
                let slot3Name           = agent.abilities[2].displayName
                let slot3Description    = agent.abilities[2].description
                let slotUltName         = agent.abilities[3].displayName
                let slotUltDescription  = agent.abilities[3].description
                let slotOne = (slot1Name,slot1Descriptin)
                let slotTwo = (slot2Name, slot2Description)
                let slotThree = (slot3Name, slot3Description)
                let ultSlot = (slotUltName, slotUltDescription)
                let agentAbilities = [slotOne, slotTwo, slotThree, ultSlot]
//
//                agentAbilities.append(slotOne)
//                agentAbilities.append(slotTwo)
//                agentAbilities.append(slotThree)
//                agentAbilities.append(ultSlot)
                
                
                let agent = Agents(displayName: displayName,
                                   descriptino: description,
                                   displayIcon: display,
                                   slot1Name: slot1Name,
                                   slot1Description: slot1Descriptin,
                                   slot2Name: slot2Name,
                                   slot2Description: slot2Description,
                                   slot3Name: slot3Name,
                                   slot3Description: slot3Description,
                                   slotUltName: slotUltName,
                                   slotUltDescription: slotUltDescription,
                                   allAgentsAbilities: agentAbilities)
                

                                  
                agentList.append(agent)
            }
            return .success(agentList)
        } catch {
            return .failure(error)
        }                                           
    }
    
}

extension AgentAPI {
    func setAgentData() {
      
    }
}
