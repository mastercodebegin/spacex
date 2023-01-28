//
//  LaunchLinks.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import Foundation
struct LaunchLinks : Codable {
	let patch : Patch?
	let reddit : Reddit?
	let flickr : Flickr?
	let presskit : String?
	let webcast : String?
	let youtube_id : String?
	let article : String?
	let wikipedia : String?

	enum CodingKeys: String, CodingKey {

		case patch = "patch"
		case reddit = "reddit"
		case flickr = "flickr"
		case presskit = "presskit"
		case webcast = "webcast"
		case youtube_id = "youtube_id"
		case article = "article"
		case wikipedia = "wikipedia"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		patch = try values.decodeIfPresent(Patch.self, forKey: .patch)
		reddit = try values.decodeIfPresent(Reddit.self, forKey: .reddit)
		flickr = try values.decodeIfPresent(Flickr.self, forKey: .flickr)
		presskit = try values.decodeIfPresent(String.self, forKey: .presskit)
		webcast = try values.decodeIfPresent(String.self, forKey: .webcast)
		youtube_id = try values.decodeIfPresent(String.self, forKey: .youtube_id)
		article = try values.decodeIfPresent(String.self, forKey: .article)
		wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia)
	}

}
