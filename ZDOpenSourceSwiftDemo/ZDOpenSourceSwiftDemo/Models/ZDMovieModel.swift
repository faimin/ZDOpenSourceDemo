//
//  ZDMovieModel.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2018/6/14.
//  Copyright © 2018年 Zero.D.Saber. All rights reserved.
//

import Foundation

struct ZDMovieWrapModel: Codable {
    let bImg, date: String
    let hasPromo: Bool
    let lid: Int
    let ms: [ZDMovieModel]
    let newActivitiesTime: Int
    let promo: Dictionary<String, String>
    let totalComingMovie: Int
    let voucherMsg: String?
    
    enum CodingKeys: String, CodingKey {
        case bImg
        case date
        case hasPromo
        case lid
        case ms
        case newActivitiesTime
        case promo
        case totalComingMovie
        case voucherMsg
    }
}

struct ZDMovieModel: Codable {
    let nearestCinemaCount, nearestDay, nearestShowtimeCount: Int
    let aN1, aN2, actors: String
    let cC: Int
    let commonSpecial, d, dN: String
    let def, filmId: Int
    let img: String
    let is3D, isDMAX, isFilter, isHasTrailer: Bool
    let isHot, isIMAX, isIMAX3D, isNew: Bool
    let isTicket: Bool
    let m: String?
    let movieType: String
    let p: [String]
    let preferentialFlag: Bool
    let r: Double
    let rc: Int
    let rd: String
    let rsC, sC: Int
    let title, titleCN, titleEN: String
    let ua: Int
    let versions: [ZDVersion]
    let wantedCount: Int
    let year: String

    enum CodingKeys: String, CodingKey {
        case nearestCinemaCount = "NearestCinemaCount"
        case nearestDay = "NearestDay"
        case nearestShowtimeCount = "NearestShowtimeCount"
        case title = "t"
        case titleCN = "tCn"
        case titleEN = "tEn"
        case filmId = "id"
        case aN1, aN2, actors, cC, commonSpecial, d, dN, def, img, is3D, isDMAX, isFilter, isHasTrailer, isHot, isIMAX, isIMAX3D, isNew, isTicket, m, movieType, p, preferentialFlag, r, rc, rd, rsC, sC, ua, versions, wantedCount, year
    }
}

struct ZDVersion: Codable {
    let enumType: Int
    let versionType: String
    
    enum CodingKeys: String, CodingKey {
        case enumType = "enum"
        case versionType = "version"
    }
}


// MARK:- Convenience initializers

extension ZDMovieWrapModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bImg = try container.decode(String.self, forKey: .bImg)
        date = try container.decode(String.self, forKey: .date)
        lid = try container.decode(Int.self, forKey: .lid)
        hasPromo = try container.decode(Bool.self, forKey: .hasPromo)
        ms = try container.decode([ZDMovieModel].self, forKey: .ms)
        newActivitiesTime = try container.decode(Int.self, forKey: .newActivitiesTime)
        promo = try container.decode(Dictionary<String, String>.self, forKey: .promo)
        totalComingMovie = try container.decode(Int.self, forKey: .totalComingMovie)
        voucherMsg = try container.decodeIfPresent(String.self, forKey: .voucherMsg)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bImg, forKey: .bImg)
        try container.encode(date, forKey: .date)
        try container.encode(lid, forKey: .lid)
        try container.encode(hasPromo, forKey: .hasPromo)
        try container.encode(ms, forKey: .ms)
        try container.encode(newActivitiesTime, forKey: .newActivitiesTime)
        try container.encode(promo, forKey: .promo)
        try container.encode(totalComingMovie, forKey: .totalComingMovie)
        try container.encodeIfPresent(voucherMsg, forKey: .voucherMsg)
    }
}

extension ZDMovieModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nearestCinemaCount = try container.decode(Int.self, forKey: .nearestCinemaCount)
        nearestDay = try container.decode(Int.self, forKey: .nearestDay)
        nearestShowtimeCount = try container.decode(Int.self, forKey: .nearestShowtimeCount)
        aN1 = try container.decode(String.self, forKey: .aN1)
        aN2 = try container.decode(String.self, forKey: .aN2)
        actors = try container.decode(String.self, forKey: .actors)
        cC = try container.decode(Int.self, forKey: .cC)
        commonSpecial = try container.decode(String.self, forKey: .commonSpecial)
        d = try container.decode(String.self, forKey: .d)
        dN = try container.decode(String.self, forKey: .dN)
        def = try container.decode(Int.self, forKey: .def)
        filmId = try container.decode(Int.self, forKey: .filmId)
        img = try container.decode(String.self, forKey: .img)
        is3D = try container.decode(Bool.self, forKey: .is3D)
        isIMAX = try container.decode(Bool.self, forKey: .isIMAX)
        isDMAX = try container.decode(Bool.self, forKey: .isDMAX)
        isFilter = try container.decode(Bool.self, forKey: .isFilter)
        isHasTrailer = try container.decode(Bool.self, forKey: .isHasTrailer)
        isHot = try container.decode(Bool.self, forKey: .isHot)
        isIMAX3D = try container.decode(Bool.self, forKey: .isIMAX3D)
        isNew = try container.decode(Bool.self, forKey: .isNew)
        isTicket = try container.decode(Bool.self, forKey: .isTicket)
        m = try container.decodeIfPresent(String.self, forKey: .m)
        movieType = try container.decode(String.self, forKey: .movieType)
        p = try container.decode([String].self, forKey: .p)
        preferentialFlag = try container.decode(Bool.self, forKey: .preferentialFlag)
        r = try container.decode(Double.self, forKey: .r)
        rc = try container.decode(Int.self, forKey: .rc)
        rd = try container.decode(String.self, forKey: .rd)
        rsC = try container.decode(Int.self, forKey: .rsC)
        sC = try container.decode(Int.self, forKey: .sC)
        title = try container.decode(String.self, forKey: .title)
        titleCN = try container.decode(String.self, forKey: .titleCN)
        titleEN = try container.decode(String.self, forKey: .titleEN)
        ua = try container.decode(Int.self, forKey: .ua)
        versions = try container.decode([ZDVersion].self, forKey: .versions)
        wantedCount = try container.decode(Int.self, forKey: .wantedCount)
        year = try container.decode(String.self, forKey: .year)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nearestCinemaCount, forKey: .nearestCinemaCount)
        try container.encode(nearestDay, forKey: .nearestDay)
        try container.encode(nearestShowtimeCount, forKey: .nearestShowtimeCount)
        try container.encode(aN1, forKey: .aN1)
        try container.encode(aN2, forKey: .aN2)
        try container.encode(actors, forKey: .actors)
        try container.encode(cC, forKey: .cC)
        try container.encode(commonSpecial, forKey: .commonSpecial)
        try container.encode(d, forKey: .d)
        try container.encode(dN, forKey: .dN)
        try container.encode(def, forKey: .def)
        try container.encode(filmId, forKey: .filmId)
        try container.encode(img, forKey: .img)
        try container.encode(is3D, forKey: .is3D)
        try container.encode(isIMAX, forKey: .isIMAX)
        try container.encode(isDMAX, forKey: .isDMAX)
        try container.encode(isFilter, forKey: .isFilter)
        try container.encode(isHasTrailer, forKey: .isHasTrailer)
        try container.encode(isHot, forKey: .isHot)
        try container.encode(isIMAX3D, forKey: .isIMAX3D)
        try container.encode(isNew, forKey: .isNew)
        try container.encode(isTicket, forKey: .isTicket)
        try container.encodeIfPresent(m, forKey: .m)
        try container.encode(movieType, forKey: .movieType)
        try container.encode(p, forKey: .p)
        try container.encode(preferentialFlag, forKey: .preferentialFlag)
        try container.encode(r, forKey: .r)
        try container.encode(rc, forKey: .rc)
        try container.encode(rd, forKey: .rd)
        try container.encode(rsC, forKey: .rsC)
        try container.encode(sC, forKey: .sC)
        try container.encode(title, forKey: .title)
        try container.encode(titleCN, forKey: .titleCN)
        try container.encode(titleEN, forKey: .titleEN)
        try container.encode(ua, forKey: .ua)
        try container.encode(versions, forKey: .versions)
        try container.encode(wantedCount, forKey: .wantedCount)
        try container.encode(year, forKey: .year)
    }
}


extension ZDVersion {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        enumType = try container.decode(Int.self, forKey: .enumType)
        versionType = try container.decode(String.self, forKey: .versionType)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(enumType, forKey: .enumType)
        try container.encode(versionType, forKey: .versionType)
    }
}
