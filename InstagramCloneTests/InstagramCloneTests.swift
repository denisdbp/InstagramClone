//
//  InstagramCloneTests.swift
//  InstagramCloneTests
//
//  Created by Admin on 29/08/22.
//

import XCTest
@testable import InstagramClone

class InstagramCloneTests: XCTestCase {
    
    var viewModel:FeedViewModel?
    var uuid:String?
    var email:String?
    var password:String?
    
    override func setUpWithError() throws {
        self.viewModel = FeedViewModel()
        self.email = "teste@hotmail.com"
        self.password = "123456"
    }

    override func tearDownWithError() throws {
        self.uuid = ""
        self.email = ""
        self.password = ""
    }
    
    func testCreateUserSuccessfully(){
        let expectation = expectation(description: "Teste de criacao de usuario")
        self.viewModel?.createUser(email: self.email ?? "", password: self.password ?? "") { (result, error) in
            self.uuid = result?.user.uid
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(self.uuid)
        }
    }
    
    func testLoginUserSuccessfully(){
        let expectation = expectation(description: "Teste de login")
        self.viewModel?.loginUser(email: self.email ?? "", password: self.password ?? "") { (result, error) in
            self.uuid = result?.user.uid
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(self.uuid)
        }
    }
    
    func testCreateUserError(){
        let email = "teste"
        let password = "12345"
        let expectation = expectation(description: "Teste de erro ao criar um usuario")
        self.viewModel?.createUser(email: email, password: password) { (result, error) in
            self.uuid = result?.user.uid
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(self.uuid)
        }
    }
    
    func testLoginUserError(){
        let email = "teste"
        let password = "12345"
        let expectation = expectation(description: "Teste de erro ao faze um login")
        self.viewModel?.loginUser(email: email, password: password) { (result, error) in
            self.uuid = result?.user.uid
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(self.uuid)
        }
    }
    
    func testGetImageStatus(){
        XCTAssertNotNil(self.viewModel?.getImageStatus(indexPath:0))
    }
    
    func testUpdateLikedTrue(){
        let feedModel = FeedModel(id: 0, image: "imagem", description: "", commentes: "", liked: true)
        self.viewModel?.updateLiked(feedModel)
        XCTAssertEqual(self.viewModel?.feedModel[0].liked, true)
    }
    
    func testUpdateLikedFalse(){
        let feedModel = FeedModel(id: 0, image: "imagem", description: "", commentes: "", liked: false)
        self.viewModel?.updateLiked(feedModel)
        XCTAssertEqual(self.viewModel?.feedModel[0].liked, false)
    }
}
