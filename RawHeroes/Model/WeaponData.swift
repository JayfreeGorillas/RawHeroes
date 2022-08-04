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
// skins here
//MARK: todo - add the skins for each weapon
/*
 "uuid": "63e6c2b6-4a8e-869c-3d4c-e38355226584",
 "displayName": "Odin",
 "category": "EEquippableCategory::Heavy",
 "defaultSkinUuid": "f454efd1-49cb-372f-7096-d394df615308",
 "displayIcon": "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png",
 "killStreamIcon": "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png",
 "assetPath": "ShooterGame/Content/Equippables/Guns/HvyMachineGuns/HMG/HMGPrimaryAsset",
 "weaponStats": {15 items},
 "shopData": {9 items},
 "skins": [15 items]
 */
