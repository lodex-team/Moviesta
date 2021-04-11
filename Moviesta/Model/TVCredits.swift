import Foundation

// MARK: - Welcome
struct TVCredits: Codable {
    let cast: [TVCast]?
    let crew: [TVCrew]?
    let id: Int?
}

// MARK: - Cast
struct TVCast: Codable {
    let character, creditID: String?
    let id: Int?
    let name: String?
    let gender: Int?
    let profilePath: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case character
        case creditID = "credit_id"
        case id, name, gender
        case profilePath = "profile_path"
        case order
    }
}

// MARK: - Crew
struct TVCrew: Codable {
    let creditID, department: String?
    let id: Int?
    let name: String?
    let gender: Int?
    let job, profilePath: String?

    enum CodingKeys: String, CodingKey {
        case creditID = "credit_id"
        case department, id, name, gender, job
        case profilePath = "profile_path"
    }
}
