import Foundation

class WeaponStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: .default)
    }()
    
    func fetchWeapons(completion: @escaping (Result<[Weapon], Error>) -> Void) {
        let url = WeaponAPI.weaponsURL
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { data, response, error in
            let result = self.processWeaponRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }

    private func processWeaponRequest(data: Data?, error: Error?) -> Result<[Weapon], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return WeaponAPI.weapons(fromJSON: jsonData)
    }
}
