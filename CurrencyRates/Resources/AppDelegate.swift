//
//  AppDelegate.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let viewModel = HomeScreenViewModel(dataSource: HomeScreenDataSource())
        window?.rootViewController = UINavigationController(rootViewController: HomeScreenViewController(viewModel: viewModel))
        
        return true
    }


}

