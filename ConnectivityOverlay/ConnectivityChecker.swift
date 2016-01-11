//
//  ConnectivityChecker.swift
//  ConnectivityOverlay
//
//  Created by Dan Ursu on 10/01/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import UIKit

// This class handles tells us the connection type by opening a socket(See Reachability currentReachabilityStatus implementation). The internal implementation can change as long as the method signature doesnt.

class ConnectivityChecker: NSObject {
    func currentConnectionType() -> Reachability.NetworkStatus {
        do {
           return try Reachability.reachabilityForInternetConnection().currentReachabilityStatus
        } catch {
            return Reachability.NetworkStatus.NotReachable
        }
    }
}
