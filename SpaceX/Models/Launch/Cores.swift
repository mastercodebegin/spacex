//
//  Cores.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import Foundation
struct Cores : Codable {
	let core : String?
	let flight : Int?
	let gridfins : Bool?
	let legs : Bool?
	let reused : Bool?
	let landing_attempt : Bool?
	let landing_success : Bool?
	let landing_type : String?
	let landpad : String?

	enum CodingKeys: String, CodingKey {

		case core = "core"
		case flight = "flight"
		case gridfins = "gridfins"
		case legs = "legs"
		case reused = "reused"
		case landing_attempt = "landing_attempt"
		case landing_success = "landing_success"
		case landing_type = "landing_type"
		case landpad = "landpad"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		core = try values.decodeIfPresent(String.self, forKey: .core)
		flight = try values.decodeIfPresent(Int.self, forKey: .flight)
		gridfins = try values.decodeIfPresent(Bool.self, forKey: .gridfins)
		legs = try values.decodeIfPresent(Bool.self, forKey: .legs)
		reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
		landing_attempt = try values.decodeIfPresent(Bool.self, forKey: .landing_attempt)
		landing_success = try values.decodeIfPresent(Bool.self, forKey: .landing_success)
		landing_type = try values.decodeIfPresent(String.self, forKey: .landing_type)
		landpad = try values.decodeIfPresent(String.self, forKey: .landpad)
	}

}
