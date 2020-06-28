//
//  BaseClass.swift
//
//  Created by Mohamed on 6/8/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case todayCases
    case active
    case totalTests
    case casesPerOneMillion
    case todayDeaths
    case testsPerOneMillion
    case deathsPerOneMillion
    case country
    case deaths
    case cases
    case recovered
    case critical
  }

  var todayCases: Int?
  var active: Int?
  var totalTests: Int?
  var casesPerOneMillion: Int?
  var todayDeaths: Int?
  var testsPerOneMillion: Int?
  var deathsPerOneMillion: Int?
  var country: String?
  var deaths: Int?
  var cases: Int?
  var recovered: Int?
  var critical: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    todayCases = try container.decodeIfPresent(Int.self, forKey: .todayCases)
    active = try container.decodeIfPresent(Int.self, forKey: .active)
    totalTests = try container.decodeIfPresent(Int.self, forKey: .totalTests)
    casesPerOneMillion = try container.decodeIfPresent(Int.self, forKey: .casesPerOneMillion)
    todayDeaths = try container.decodeIfPresent(Int.self, forKey: .todayDeaths)
    testsPerOneMillion = try container.decodeIfPresent(Int.self, forKey: .testsPerOneMillion)
    deathsPerOneMillion = try container.decodeIfPresent(Int.self, forKey: .deathsPerOneMillion)
    country = try container.decodeIfPresent(String.self, forKey: .country)
    deaths = try container.decodeIfPresent(Int.self, forKey: .deaths)
    cases = try container.decodeIfPresent(Int.self, forKey: .cases)
    recovered = try container.decodeIfPresent(Int.self, forKey: .recovered)
    critical = try container.decodeIfPresent(Int.self, forKey: .critical)
  }

}
