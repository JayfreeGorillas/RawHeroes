//
//  AgentStore.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 4/9/22.
//

import Foundation

class AgentStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: .default)
    }()
    
    func fetchAgents(completion: @escaping (Result<[Agent], Error>) -> Void) {
        // escaping declared that the closure is going to live longer than the function I pass it too
        let url = AgentAPI.agentsURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            let result = self.processAgentRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }

    private func processAgentRequest(data: Data?, error: Error?) -> Result<[Agent], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return AgentAPI.agents(fromJSON: jsonData)
    }
}
