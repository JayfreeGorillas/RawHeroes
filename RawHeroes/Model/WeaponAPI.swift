import Foundation

struct WeaponAPI {
    static var weaponsURL = URL(string: "https://valorant-api.com/v1/weapons")
    static func weapons(fromJSON data: Data) -> Result<[Weapon], Error> {
        
// MARK: Result Type Imlementation
        Result { try JSONDecoder().decode(AllWeaponData.self, from: data).data }
    }
}
