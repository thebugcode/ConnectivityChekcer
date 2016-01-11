//
//  ConnectivityInteractor.swift
//  ConnectivityOverlay
//
//  Created by Dan Ursu on 10/01/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import UIKit

class ConnectivityInteractor: NSObject {
    private let connectivityChecker: ConnectivityChecker
    static var shouldAllowDownloads: Bool?
    
    required init(connectivityChecker: ConnectivityChecker = ConnectivityChecker()) {
        self.connectivityChecker = connectivityChecker
    }
    
    func shouldAllowLargeDownloads() -> Bool {
        if let allowDownloads = ConnectivityInteractor.shouldAllowDownloads {
            return allowDownloads
        } else {
            switch (connectivityChecker.currentConnectionType()) {
            case .ReachableViaWiFi: return true
            case .ReachableViaWWAN : return false
            case .NotReachable: return false
            }
        }
    }
    
    
    func hideDownloadsRestrictedWarningUntilColdStart() {
        // This method uses a class variable as persistence between cold app starts.
        ConnectivityInteractor.shouldAllowDownloads = true
    }
    
}
