//
//  PersonCoder.swift
//  DataModel
//
//  Created by John Bethancourt on 2/10/21.
//

import Foundation

struct PBSPerson: Codable {
    var id: String
    var roleAssignments: JSONNull?
    var callSign, lastName, firstName, contactNumber: String
    var email: String
    var dodID, rankID: Int
    var primaryOrganizationID: String

    enum CodingKeys: String, CodingKey {
        case id, roleAssignments, callSign, lastName, firstName, contactNumber, email
        case dodID = "dodId"
        case rankID = "rankId"
        case primaryOrganizationID = "primaryOrganizationId"
    }
}

extension PBSPerson {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PBSPerson.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        roleAssignments: JSONNull?? = nil,
        callSign: String? = nil,
        lastName: String? = nil,
        firstName: String? = nil,
        contactNumber: String? = nil,
        email: String? = nil,
        dodID: Int? = nil,
        rankID: Int? = nil,
        primaryOrganizationID: String? = nil
    ) -> PBSPerson {
        return PBSPerson(
            id: id ?? self.id,
            roleAssignments: roleAssignments ?? self.roleAssignments,
            callSign: callSign ?? self.callSign,
            lastName: lastName ?? self.lastName,
            firstName: firstName ?? self.firstName,
            contactNumber: contactNumber ?? self.contactNumber,
            email: email ?? self.email,
            dodID: dodID ?? self.dodID,
            rankID: rankID ?? self.rankID,
            primaryOrganizationID: primaryOrganizationID ?? self.primaryOrganizationID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func personTask(with url: URL, completionHandler: @escaping (PBSPerson?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

