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
//    TODO
    override func setUpWithError() throws {
        let mockNetworkManager = MockNetworkManager()
//        viewModel = CharacterViewModel(networkManager: MockNetworkManager())
    }

    override func tearDownWithError() throws {

        viewModel = nil
    }

   

    func testgetAllCharacters_When_Passing_ValidURL() throws {
        // This is an example of a performance test case.
//       TODO
    }

}
