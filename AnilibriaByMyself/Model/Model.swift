struct ResponseData: Decodable {
    let list: [Item]?
    let pagination: Pagination?
}

struct Item: Decodable {
    let id: Int?
    let code: String?
    let names: Names?
    let franchises: [FranchiseItem]?
    let announce: String?
    let status: Status?
    let posters: Posters?
    let updated: Int?
    let lastChange: Int?
    let type: ItemType?
    let genres: [String]?
    let team: Team?
    let season: Season?
    let description: String?
    let inFavorites: Int?
    let player: Player?
}

struct Names: Decodable {
    let ru: String?
    let en: String?
    let alternative: String?
}

struct FranchiseItem: Decodable {
    let franchise: FranchiseDetails?
    let releases: [Release]?
}

struct FranchiseDetails: Decodable {
    let id: String?
    let name: String?
}

struct Release: Decodable {
    let id: Int?
    let code: String?
    let ordinal: Int?
    let names: ReleaseNames?
}

struct ReleaseNames: Decodable {
    let ru: String?
    let en: String?
    let alternative: String?
}

struct Status: Decodable {
    let string: String?
    let code: Int?
}

struct Posters: Decodable {
    let small: PosterSize?
    let medium: PosterSize?
    let original: PosterSize?
}

struct PosterSize: Decodable {
    let url: String?
    let rawBase64File: String?
}

struct ItemType: Decodable {
    let fullString: String?
    let code: Int?
    let string: String?
    let episodes: Int?
    let length: Int?
}

struct Team: Decodable {
    let voice: [String]?
    let translator: [String]?
    let editing: [String]?
    let decor: [String]?
    let timing: [String]?
}

struct Season: Decodable {
    let string: String?
    let code: Int?
    let year: Int?
    let weekDay: Int?
}

struct Player: Decodable {
    let alternativePlayer: String?
    let host: String?
    let isRutube: Bool?
    let episodes: Episodes?
    let list: [String: Episode]?
}

struct Episodes: Decodable {
    let first: Int?
    let last: Int?
    let string: String?
}

struct Episode: Decodable {
    let episode: Int?
    let name: String?
    let uuid: String?
    let createdTimestamp: Int?
    let preview: String?
    let skips: Skips?
    let hls: HLS?
}

struct Skips: Decodable {
    let opening: [Int]?
    let ending: [Int]?
}

struct HLS: Decodable {
    let fhd: String?
    let hd: String?
    let sd: String?
}

struct Quality: Decodable {
    let string: String?
    let type: String?
    let resolution: String?
    let encoder: String?
    let lqAudio: String?
}

struct Pagination: Decodable {
    let pages: Int?
    let currentPage: Int?
    let itemsPerPage: Int?
    let totalItems: Int?
}
