//
//  todoList2Tests.swift
//  todoList2Tests
//
//  Created by Aiyana Rettinghouse on 10/25/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import XCTest
@testable import todoList2

class todoList2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_add_item_to_TODO_array(){
        let itemArray: [Item] = [Item(fromInput: "hello")]
        XCTAssertEqual("hello",itemArray[0].description)
    }
    
    func test_encode_and_decode_ItemArray(){
        let itemArray: [Item] = [Item(fromInput: "hello")]
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let encoded = try! encoder.encode(itemArray)
        UserDefaults.standard.set(encoded, forKey: "test")
        let dataFromStorage = UserDefaults.standard.object(forKey: "test") as! Data
        var newItemArray = try! decoder.decode([Item].self, from: dataFromStorage)
        
        XCTAssertEqual(itemArray[0].description, newItemArray[0].description)
    }
    
}
