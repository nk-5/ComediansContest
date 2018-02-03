//
//  MainTabBarController.swift
//  ComediansContest
//
//  Created by 中川 慶悟 on 2018/02/04.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func tabBar(_: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }

    func tabBarController(_: UITabBarController, didSelect viewController: UIViewController) {
        print(viewController)
    }
}
