//
//  PromptNavigationController.swift
//
//  Created by TeraWing on 2019-09-08
//


import UIKit

protocol PromptNavigationDelegate {
    func navigationController(_ navigationController: UINavigationController, shouldPop controller: UIViewController, pop: @escaping () -> Void) -> Bool
}

class PromptNavigationController: UINavigationController {
    
    weak var promptNavDelegate: PromptNavigationController?
    
    private func shouldPop(animated: Bool) -> Bool {
        if let vc = self.viewControllers.last {
            return promptNavDelegate?.navigationController(self, shouldPop: vc) {
                super.popViewController(animated: animated)
            } ?? true
        }
        return true
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        return shouldPop(animated: animated) ? super.popViewController(animated: animated) : nil
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        return shouldPop(animated: animated) ? super.popToRootViewController(animated: animated) : nil
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        return shouldPop(animated: animated) ? super.popToViewController(viewController, animated: animated) : nil
    }
}

extension PromptNavigationController: UINavigationController {
    
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if item == viewControllers.last?.navigationItem {
            _ = self.popViewController(animated: true)
            return false
        }
        return true
    }

}
