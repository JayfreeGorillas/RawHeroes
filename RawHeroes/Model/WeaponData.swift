//
//  WeaponData.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 8/2/22.
//

import Foundation

struct AllWeaponData: Decodable {
    let data: [Weapon]
}

struct Weapon: Decodable {
    let displayName: String
    let displayIcon: URL
    let skins: [Skins]
}

struct Skins: Decodable {
    let displayName: String
    let displayIcon: URL?
}
