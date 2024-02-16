//
//  CharacterViewModelTests.swift
//  AppolyTechnicalChallengeTests
//
//  Created by Sandhya on 22/12/2023.
//

import XCTest
@testable import AppolyTechnicalChallenge

final class CharacterViewModelTests: XCTestCase {
    var viewModel: CharacterViewModel!
    var mockNetworkManager: NetworkManager!

//    TODO
    @MainActor override func setUp() {
        super.setUp()
        mockNetworkManager = NetworkManager()
        viewModel = CharacterViewModel(networkManager: mockNetworkManager)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        super.tearDown()
    }

    func testgetAllCharacters_When_Passing_ValidURL() async {
        // This is an example of a performance test case.
//       TODO *********?
        XCTAssertNotNil(viewModel)
        let expectation = XCTestExpectation(description: "Fetching All Characters list")
        await self.viewModel.getAllCharacters(for: .allCharacters)
        
        let charactersList = await self.viewModel.characters.first
     
//        XCTAssertNil(NetworkError.invalidURL)
        
        expectation.fulfill()
    }

}


