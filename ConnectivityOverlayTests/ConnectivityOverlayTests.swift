//
//  ConnectivityOverlayTests.swift
//  ConnectivityOverlayTests
//
//  Created by Dan Ursu on 07/01/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import XCTest
@testable import ConnectivityOverlay

class ConnectivityOverlayTests: XCTestCase {
    
    func testIfWifiConnectionAllowsDownloads() {
        let interactor = ConnectivityInteractor(connectivityChecker: WifiConnectivityChecker())
        XCTAssertTrue(interactor.shouldAllowLargeDownloads() == true)
    }
    
    
    func testIf3GConnectionForbidsDownloads() {
        let interactor = ConnectivityInteractor(connectivityChecker: WANConnectivityChecker())
        XCTAssertTrue(interactor.shouldAllowLargeDownloads() == false)
    }
    
    
    func testIf3GConnectionAllowsDownloadsUntilNextColdStart() {
        //By default a WAN connection doesnt allow large downloads
        let interactor = ConnectivityInteractor(connectivityChecker: WANConnectivityChecker())
        XCTAssertTrue(interactor.shouldAllowLargeDownloads() == false)
        
        //Asking the interactor to hide the warning allows downloads
        interactor.hideDownloadsRestrictedWarningUntilColdStart()
        XCTAssertTrue(interactor.shouldAllowLargeDownloads() == true)
        
        // Imitate a cold start by reseting the class variable
        ConnectivityInteractor.shouldAllowDownloads = nil
        XCTAssertTrue(interactor.shouldAllowLargeDownloads() == false)
    }
}


class WANConnectivityChecker: ConnectivityChecker {
  override func currentConnectionType() -> Reachability.NetworkStatus {
        return .ReachableViaWWAN
    }
}

class WifiConnectivityChecker: ConnectivityChecker {
    override func currentConnectionType() -> Reachability.NetworkStatus {
        return .ReachableViaWiFi
    }
}
