//
//  Flickr.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import Foundation
struct Flickr : Codable {
	let small : [String]?
	let original : [String]?

	enum CodingKeys: String, CodingKey {

		case small = "small"
		case original = "original"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		small = try values.decodeIfPresent([String].self, forKey: .small)
		original = try values.decodeIfPresent([String].self, forKey: .original)
	}

}
