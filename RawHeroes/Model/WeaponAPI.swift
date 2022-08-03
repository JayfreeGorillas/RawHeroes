//
//  WeaponAPI.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 8/3/22.
//

import Foundation

struct WeaponAPI {
//    private static let weaponsURL = "https://valorant-api.com/v1/weapons"
    
    
    static var weaponsURL = URL(string: "https://valorant-api.com/v1/weapons")
    static func weapons(fromJSON data: Data) -> Result<[Weapon], Error> {
        let decoder = JSONDecoder()
        
        do {
            let weaponResponse = try decoder.decode(AllWeaponData.self, from: data)
            
            return .success(weaponResponse.data)
        } catch {
            return .failure(error)
        }
    }
}
