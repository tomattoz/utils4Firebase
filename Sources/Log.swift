//  Created by Ivan Kh on 14.09.2023.

import Foundation
import FirebaseCrashlytics
import FirebaseAnalytics
import Utils9

private extension CharacterSet {
    static let eventSafeCharacters = CharacterSet.letters.union(CharacterSet.decimalDigits)
}

public struct FirebaseLogger: LogAdapter {
    public init() {
    }

    public func log(error: Error, info: String?) {
        var userInfo = Logger.shared.additionalInfo
        
        userInfo["tech"] = error.techDescription
        userInfo.merge((error as AdditionalInfoError).additionalInfo) { (_, new) in new }
        
        if let info {
            userInfo["info"] = info
        }
        
        Crashlytics.crashlytics().record(error: error, userInfo: userInfo)
    }
    
    public func log(event: String, parameters: [String: String]) {
        let event = String(event.map { CharacterSet.eventSafeCharacters.contains($0) ? $0 : "_" })
        Analytics.logEvent(event, parameters: parameters)
    }
    
    public func log(info: String) {
        print("🔵 \(info)")
    }
    
    public func set(property: String, for key: String) {
        Analytics.setUserProperty(property, forName: key)
    }
}
