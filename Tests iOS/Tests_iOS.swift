//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by holgermayer on 04.11.20.
//

import XCTest

class Tests_iOS: XCTestCase {

    var app : XCUIApplication!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    func startApp() {
        // UI tests must launch the application that they test.
        
        app = XCUIApplication()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCUIDevice.shared.orientation = .landscapeLeft
        
        app/*@START_MENU_TOKEN@*/.collectionViews["Browse View"].cells["DOC.sidebar.item.On My iPad"]/*[[".otherElements.matching(identifier: \"Browse View\").collectionViews[\"Browse View\"]",".cells[\"On My iPad\"]",".cells[\"DOC.sidebar.item.On My iPad\"]",".collectionViews[\"Browse View\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.otherElements.containing(.image, identifier:"ipad").element.tap()
        app/*@START_MENU_TOKEN@*/.collectionViews["File View"]/*[[".otherElements.matching(identifier: \"Browse View\")",".otherElements[\"DOC.browsingRoot Source: com.apple.FileProvider.LocalStorage, Title: File Provider Storage\"].collectionViews[\"File View\"]",".collectionViews[\"File View\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.cells["Create Document"].children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()

    }
    
    func endDocumentEdit(){
        XCUIApplication().navigationBars["Markdown"].buttons["Back"].tap()
    }
    
    func testExample() throws {
         
        startApp()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        
        let markdownNavigationBar = app.navigationBars["Markdown"]
        
        markdownNavigationBar.buttons["Chapter"].tap()
        textView.tap()
        textView.tap()
        markdownNavigationBar.buttons["Section"].tap()
        textView.tap()
        textView.tap()

        app.keys["H"].tap()
        app.keys["u"].tap()
        app.keys["g"].tap()
        app.keys["o"].tap()

        markdownNavigationBar.otherElements.containing(.button, identifier:"Chapter").element.tap()
        markdownNavigationBar.buttons["italic"].tap()
          
         
        app.keys["H"].tap()
        app.keys["u"].tap()
        app.keys["g"].tap()
        app.keys["o"].tap()

        endDocumentEdit()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}


