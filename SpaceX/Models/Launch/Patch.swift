//
//  Patch.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import Foundation
struct Patch : Codable {
	let small : String?
	let large : String?

	enum CodingKeys: String, CodingKey {

		case small = "small"
		case large = "large"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		small = try values.decodeIfPresent(String.self, forKey: .small)
		large = try values.decodeIfPresent(String.self, forKey: .large)
	}

}
