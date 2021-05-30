//
//  PayModeVMTests.swift
//  PayoneerTests
//
//  Created by Shanika Vithanage on 5/30/21.
//

import XCTest
@testable import Payoneer

class PayModeVMTests: XCTestCase {
    
    var viewModel: PayModeVM!
    var mockPayModeService: MockPayModeService!

    override func setUp() {
        mockPayModeService = MockPayModeService()
        viewModel = .init(dataSource: mockPayModeService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockPayModeService = nil
        
        super.tearDown()
    }
    
    func testGetPayModesSuccessWithEmptyData() {
        // Set empty success result
        mockPayModeService.payModeResult = .success(Data())
        
        // Start fetch
        viewModel.getAllPayModes()
        
        addExpectationDelay()
        
        // Should not have any paymodes
        XCTAssertEqual(viewModel.payModeList.value.count, 0)
        // Should give out the error because the result is not decodable
        XCTAssertEqual(viewModel.payModeListError.value, "Error occured while retrieving payment modes")
    }
    
    func testGetPayModesServiceFailure() {
        // Set error result
        mockPayModeService.payModeResult = .failure("Error occured")
        
        // Start fetch
        viewModel.getAllPayModes()
        
        addExpectationDelay()
        
        // Should set the same error to the UI
        XCTAssertEqual(viewModel.payModeListError.value, "Error occured")
    }
    
    func testGetPayModesSuccessWithEmptyMockData() {
        // Set success result
        mockPayModeService.payModeResult = .success(MockData.emptyNetworksList)
        
        // Start fetch
        viewModel.getAllPayModes()
        
        addExpectationDelay()
        
        // Check paymode count
        XCTAssertEqual(viewModel.payModeList.value.count, 0)
        // Should not give any error
        XCTAssertEqual(viewModel.payModeListError.value, "")
    }
    
    func testGetPayModesSuccessWithProperMockDataForGroupCount() {
        // Set success result
        mockPayModeService.payModeResult = .success(MockData.networks)
        
        // Start fetch
        viewModel.getAllPayModes()
        
        addExpectationDelay()
        
        // Check paymode count - there are 3 groups in mock data
        XCTAssertEqual(viewModel.payModeList.value.count, 3)
    }
    
    func testGetPayModesSuccessWithProperMockDataForSorting() {
        // Set success result
        mockPayModeService.payModeResult = .success(MockData.networks)
        
        // Start fetch
        viewModel.getAllPayModes()
        
        addExpectationDelay()
        
        // After sorting the group names CREDIT_CARD should come first
        XCTAssertEqual(viewModel.payModeList.value.first?.groupName, "CREDIT_CARD")
        // After sorting the group names WALLET should come last
        XCTAssertEqual(viewModel.payModeList.value.last?.groupName, "WALLET")
    }
    
    func testGetPayModesSuccessWithProperMockDataForGrouping() {
        // Set success result
        mockPayModeService.payModeResult = .success(MockData.networks)
        
        // Start fetch
        viewModel.getAllPayModes()
        
        addExpectationDelay()
        
        // There's only one item in CREDIT_CARD group
        XCTAssertEqual(viewModel.payModeList.value[0].payModes.count, 1)
        // There's only one item in DEBIT_CARD group
        XCTAssertEqual(viewModel.payModeList.value[1].payModes.count, 1)
        // There's two items in WALLET group
        XCTAssertEqual(viewModel.payModeList.value[2].payModes.count, 2)
    }
    
    // MARK: Misc
    // Method to add a default expectation so the testcase can wait until asynchronous call is completed.
    // https://stackoverflow.com/a/62054921/2841916
    func addExpectationDelay() {
        let delayExpectation = XCTestExpectation()
        delayExpectation.isInverted = true
        wait(for: [delayExpectation], timeout: 1)
    }

}
