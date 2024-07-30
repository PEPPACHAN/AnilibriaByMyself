import Foundation

// MARK: TitleUpdate
struct TitleUpdate: Decodable {
    let list: [TitleUpdateList]
}

struct TitleUpdateList: Decodable {
    let id: Int
    let code: String
    let names: Names
    let franchises: [Franchises]
    let status: Status
    let posters: Posters
    let description: String
    let player: Player
}

// MARK: Names
struct Names: Decodable {
    let ru: String
    let en: String
}

// MARK: Franchises
struct Franchises: Decodable {
    let franchise: FranchiseItems
    let releases: Releases
}

struct FranchiseItems: Decodable {
    let id: String
    let name: String
}

struct Releases: Decodable {
    
}
