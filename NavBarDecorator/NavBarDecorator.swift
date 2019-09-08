//
//  NavBarDecorator.swift
//
//  Created by TeraWing on 2019-09-08
//


import Foundation

class NavBarDecorator {

    static func restore(for vc: UIViewController, defaultBarColor: UIColor, defaultTitleColor: UIColor) {
        setTranslucency(for: vc, barColor: barColor, titleColor: titleColor, toTranslucent: false)
    }
    
    static func setTranslucency(for vc: UIViewController, barColor: UIColor = .clear, titleColor: UIColor = .clear, toTranslucent: Bool = true) {
        guard let navBar = vc.navigationController?.navigationBar else {
            return
        }
        let backgroundImage = toTranslucent ? UIImage() : navigationController?
        navBar.setBackgroundImage(backgroundImage, for: .default)
        navBar.setBackgroundImage(backgroundImage, for: .compact)
        navBar.shadowImage = backgroundImage
        navBar.barTintColor = barColor
        navBar.backgroundColor = barColor
        navBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor:titleColor]
        // change navBar.isTranslucent in this method may cause crash
        navBar.isTranslucent = true
        if UIApplication.shared.responds(to: Selector(("statusBar"))),
            let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBarView.backgroundColor = inTranslucentMode ? barColor : nil
        }
        if let tabBar = vc.tabBarController?.tabBar {
            // tabBar's translucency may be changed after setting navigation bar
            tabBar.isTranslucent = false
        }
    }
}
