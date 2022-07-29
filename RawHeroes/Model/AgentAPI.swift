//
//  AgentAPI.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/9/22.
//

import Foundation
var agentList = [Agent]()
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
    
    
    static func agents(fromJSON data: Data) -> Result<[Agent], Error> {
        let decoder = JSONDecoder()
        
        do {
    
            let agentResponse = try decoder.decode(AllData.self, from: data)
            // data[19].abilities[3].displayIcon
            for agent in agentResponse.data {
                let displayName         = agent.displayName
                let description         = agent.description
                let display             = agent.displayIcon
                let slot1Icon           = agent.abilities[0].displayIcon
                let slot1Name           = agent.abilities[0].displayName
                let slot1Description    = agent.abilities[0].description
                let slot2Icon           = agent.abilities[1].displayIcon
                let slot2Name           = agent.abilities[1].displayName
                let slot2Description    = agent.abilities[1].description
                let slot3Icon           = agent.abilities[2].displayIcon
                let slot3Name           = agent.abilities[2].displayName
                let slot3Description    = agent.abilities[2].description
                let slotUltIcon         = agent.abilities[3].displayIcon
                let slotUltName         = agent.abilities[3].displayName
                let slotUltDescription  = agent.abilities[3].description
                //let abilityIcons        = [slot1Icon, slot2Icon, slot3Icon, slotUltIcon]
                let slotOne = (slot1Icon,slot1Name,slot1Description)
                let slotTwo = (slot2Icon,slot2Name, slot2Description)
                let slotThree = (slot3Icon,slot3Name, slot3Description)
                let ultSlot = (slotUltIcon,slotUltName, slotUltDescription)
                let agentAbilities = [slotOne, slotTwo, slotThree, ultSlot]
                
                
                //data[19].abilities[4].displayIcon
                
                let agent = Agent(displayName: agent.displayName,
                                  descriptino: agent.description,
                                  displayIcon: agent.displayIcon,
                                //  slot1Icon: agent.abilities[0].displayIcon,
                                  slot1Name: agent.abilities[0].displayName,
                                  slot1Description: agent.abilities[0].description,
                                 // slot2Icon: agent.abilities[1].displayIcon,
                                  slot2Name: agent.abilities[1].displayName,
                                  slot2Description: agent.abilities[1].description,
                                 // slot3Icon: agent.abilities[2].displayIcon,
                                  slot3Name: agent.abilities[2].displayName,
                                  slot3Description: agent.abilities[2].description,
                                 // slotUltIcon: agent.abilities[3].displayIcon,
                                  slotUltName: agent.abilities[3].displayName,
                                  slotUltDescription: agent.abilities[3].description,
                                  allAgentsAbilities: agentAbilities
                                 
                                  
                                  )
                                   //abilityIcons: abilityIcons
                

                                  
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
