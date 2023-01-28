//
//  Fairings.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import Foundation
struct Fairings : Codable {
	let reused : Bool?
	let recovery_attempt : Bool?
	let recovered : Bool?
	let ships : [String]?

	enum CodingKeys: String, CodingKey {

		case reused = "reused"
		case recovery_attempt = "recovery_attempt"
		case recovered = "recovered"
		case ships = "ships"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
		recovery_attempt = try values.decodeIfPresent(Bool.self, forKey: .recovery_attempt)
		recovered = try values.decodeIfPresent(Bool.self, forKey: .recovered)
		ships = try values.decodeIfPresent([String].self, forKey: .ships)
	}

}
