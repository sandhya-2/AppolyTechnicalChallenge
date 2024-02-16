//
//  NetworkManagerTests.swift
//  AppolyTechnicalChallengeTests
//
//  Created by Sandhya on 22/12/2023.
//

import XCTest
@testable import AppolyTechnicalChallenge

final class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!
    var mockNetworking: MockNetworking!
    
    @MainActor override func setUp() {
        mockNetworking = MockNetworking()
        networkManager = NetworkManager(urlSession: mockNetworking)
    }

    override func tearDown() {
        mockNetworking = nil
        networkManager = nil
    }

    /*when API is successful, get function will return expected data*/
    func testGetCharactersWhenResponseIs_200() async {
        
        // GIVEN
         let data = "response".data(using: .utf8)
        mockNetworking.mockData = data
        mockNetworking.mockResponse = HTTPURLResponse(url:URL(string: "test")!, statusCode: 200, httpVersion:nil, headerFields:nil)
        
        // When
        let actualData = try! await networkManager.get(url: URL(string: "testURl")!)
        
        // Then
        XCTAssertEqual(actualData, data)
    }

    /*when API fails with status code 404 */
    func testGetAllCharacterssWhenAPIFailsToReturnExpectedData() async {

        // Given
         let data = "response".data(using: .utf8)
        mockNetworking.mockData = data
        mockNetworking.mockResponse = HTTPURLResponse(url:URL(string: "test")!, statusCode: 404, httpVersion:nil, headerFields:nil)
        
        do {
            _ = try await networkManager.get(url: URL(string: "testURl")!)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.invalidURL)
        }
    }
    
    /*when API is fails with invalid request*/
    func testGetCharactersWhenRequestIsInValidAndYouDontGetData() async {
        do {
            mockNetworking.error =  NetworkError.invalidURL
            _ = try await networkManager.get(url: URL(string: "skdjflkjdlg")!)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFound)
        }
    }
   
}
