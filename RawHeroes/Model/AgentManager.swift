//
//  AgentManager.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/7/22.
//

import Foundation

protocol AgentManagerDelegate {
    func addAgent(agent: [AgentData])
    func didFailWithError(error: Error)
}

struct AgentManager {
    let agentString = "https://valorant-api.com/v1/agents"
    var delegate: AgentManagerDelegate?
    
    func fetchAgents() {
        let urlString = URL(string: agentString)!
        let request = URLRequest(url: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { (data, response, error) in
            if error != nil {
                                print(error)
                                self.delegate?.didFailWithError(error: error!)
                                return
                            }
                            if let agentData = data {
                               // if let agent = self.parseJSON(agentData){
                                print(String(data: agentData, encoding: .utf8))
                                    //self.delegate?.addAgent(agent: agent)
                                    //addAgentToArray(agent: agent)
                                    //comp(agent)
            
            
                                }
                                //print("Data from request")
                                //print(String(data: safeData, encoding: .utf8))
                            }
        task.resume()
                        }
                        
                    }
        

func agents(fromJSON data: Data) -> Result<[AgentData], Error> {
    
    do {
        let decoder = JSONDecoder()
        let agentResponse = try decoder.decode(AllData.self, from: data)
        print(agentResponse.data)
        return .success(agentResponse.data)
    } catch {
        return .failure(error)
    }
}

//private func processAgentsRequest(data: Data?, error: Error?) -> Result<[AllData], Error> {
//    guard let jsonData = data else {
//        return .failure(error!)
//    }
//    return AllData.init(data: [])
//}
//        print("Fetching started")
//        print(urlString)
    
    
//    func performRequest(with urlString: String, comp: @escaping ([AgentData]) -> ()) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                // Check for errors in request
//                if error != nil {
//                    print(error)
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let agentData = data {
//                    if let agent = self.parseJSON(agentData){
//
//                        self.delegate?.addAgent(agent: agent)
//                        //addAgentToArray(agent: agent)
//                        comp(agent)
//
//
//                    }
//                    print("Data from request")
//                    //print(String(data: safeData, encoding: .utf8))
//                }
//
//            }
//            task.resume()
//        }
//
//    }
    
    


    



