//
//  MockJSON.swift
//  DataModel
//
//  Created by John Bethancourt on 2/10/21.
//

import Foundation

enum SampleJSON {
    static let pbsEventData = pbsEvent.data(using: .utf8)
    static let pbsEvent =
        """
{"eventType" :227,"name":"IMS-35/AR","id":"428ed9f4-feab-4b33-ae0a-a350762acb40","startTime":"2021-01-21T13:00Z","endTime":"2021-01-21T19:00Z","notes":"171 ARW Checkride for Morshed and Smith","roleAssignments":[{"personId":"427b62d5-6ac4-4d2e-a121-7bd600a79312","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"4ee2a070-7402-495c-a833-6d840484d27c","index":0,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"MP_(AC)","roleName":"MP (AC)","id":256,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":"M(A"},"notes":[]},{"personId":"e950af0a-3ade-4460-99b5-fcae95ea471e","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"54a9359b-12cf-446d-8fc5-419546dce7e3","index":1,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"FPC","roleName":"FPC","id":251,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":"F"},"notes":[]},{"personId":"5dd68fa1-e4b5-4ea5-b1ac-c0b95fde3573","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"aba69e62-7a76-4ae1-b76a-aeda64707c5a","index":2,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"NO_ROLE","roleName":"No Role","id":139,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":""},"notes":[]},{"personId":"c0aa786e-fdba-497c-bbe0-13b353b4ba17","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"f016b986-2365-4303-858c-7c42fb0978e8","index":3,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"NO_ROLE","roleName":"No Role","id":139,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":""},"notes":[]},{"personId":"8da41e29-51d8-42d5-bb9d-69c7447c3272","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"8ca06098-96b1-4c2a-990a-4dffa907880a","index":4,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"NO_ROLE","roleName":"No Role","id":139,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":""},"notes":[]},{"personId":"743d31bd-7a13-4bb8-9856-320dfce41369","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"66345854-5dc3-4dd4-a5af-562e7b83ac74","index":5,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"NO_ROLE","roleName":"No Role","id":139,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":""},"notes":[]},{"personId":"3067c511-1e74-404b-ba74-89a4e48a9da1","eventId":"428ed9f4-feab-4b33-ae0a-a350762acb40","id":"8fd489c2-4bb8-4a3f-96f6-79193fd13cc7","index":6,"confirmationStatus":"NOT_CONTACTED","jobRole":{"roleType":"LOADMASTER_AL","roleName":"Loadmaster AL","id":99,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","active":true,"abbreviation":"LA"},"notes":[]}],"postCrewRestTime":0,"preCrewRestTimeHard":945,"preCrewRestTimeSoft":945,"updating":null,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","additionalValues":{}}
"""

    static let pbsPersons: [String: String] = {

        var personDictionary = [String: String]()

        personDictionary["427b62d5-6ac4-4d2e-a121-7bd600a79312"] =
            """
            {"id":"427b62d5-6ac4-4d2e-a121-7bd600a79312","roleAssignments":null,"callSign":"","lastName":"Hebert","firstName":"Alphonse","contactNumber":"(555) 212-2344","email":"","dodId":1234567890,"rankId":14,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":258}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        personDictionary["e950af0a-3ade-4460-99b5-fcae95ea471e"] =
            """
                {"id":"e950af0a-3ade-4460-99b5-fcae95ea471e","roleAssignments":null,"callSign":"","lastName":"Fontenot","firstName":"Amedee","contactNumber":"","email":"","dodId":1234567890,"rankId":14,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":339}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        personDictionary["5dd68fa1-e4b5-4ea5-b1ac-c0b95fde3573"] =
            """
                {"id":"5dd68fa1-e4b5-4ea5-b1ac-c0b95fde3573","roleAssignments":null,"callSign":"","lastName":"Landry","firstName":"Leon","contactNumber":"(555) 123-4444","email":"","dodId":1234567890,"rankId":14,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":256}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        personDictionary["c0aa786e-fdba-497c-bbe0-13b353b4ba17"] =
            """
                {"id":"c0aa786e-fdba-497c-bbe0-13b353b4ba17","roleAssignments":null,"callSign":"","lastName":"Broussard","firstName":"Virgil","contactNumber":"(555) 234-4553","email":"","dodId":1234567890,"rankId":14,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":335}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        personDictionary["8da41e29-51d8-42d5-bb9d-69c7447c3272"] =
            """
                {"id":"8da41e29-51d8-42d5-bb9d-69c7447c3272","roleAssignments":null,"callSign":"","lastName":"Guidry","firstName":"Theodule","contactNumber":"(555) 123-3434","email":"PATRICK.MEHOMES@US.AF.MIL","dodId":1234567890,"rankId":15,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":251}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        personDictionary["743d31bd-7a13-4bb8-9856-320dfce41369"] =
            """
                {"id":"743d31bd-7a13-4bb8-9856-320dfce41369","roleAssignments":null,"callSign":"","lastName":"Boudreaux","firstName":"Dale","contactNumber":"","email":"","dodId":1234567890,"rankId":3,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":638}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        personDictionary["3067c511-1e74-404b-ba74-89a4e48a9da1"] =
            """
                 {"id":"3067c511-1e74-404b-ba74-89a4e48a9da1","roleAssignments":null,"callSign":"","lastName":"LeBlanc","firstName":"Brandon","contactNumber":"","email":"","dodId":1234567890,"rankId":3,"organizationStatus":{"710b68b5-1786-4fa3-b51c-d91c6f9f9084":{"active":true,"organizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084","jobRoleId":248}},"primaryOrganizationId":"710b68b5-1786-4fa3-b51c-d91c6f9f9084"}
            """

        return personDictionary

    }()
}
