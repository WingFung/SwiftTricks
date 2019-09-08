//
//  LocaleUtil.swift
//
//  Created by TeraWing on 2019-09-08
//


import Foundation

class LocaleUtil {
    
    static var language: String {
        return Locale.preferredLanguages[0]
    }
    
    // key: Back, Done, Cancel ...
    static func getSystemString(_ key: String, bundleClass: AnyClass = UIButton.self) -> String? {
        let bundle = Bundle(for: bundleClass)
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }
    
    // code: USD -> Symbol: $
    static func getCurrencySymbol(code: String) -> String? {
        let locale = NSLocale(localeIdentifier: code)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
    }
}
