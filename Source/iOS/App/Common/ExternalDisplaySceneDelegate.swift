// Copyright 2022 DolphiniOS Project
// SPDX-License-Identifier: GPL-2.0-or-later

import UIKit

class ExternalDisplaySceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    // Create window explicitly to configure overscan compensation
    window = UIWindow(windowScene: windowScene)
    
    // Fix black edges on external monitor by disabling overscan compensation
    window?.screen.overscanCompensation = .none
    
    // Load the external display storyboard and set up the initial view controller
    let storyboard = UIStoryboard(name: "ExternalDisplay", bundle: nil)
    if let initialViewController = storyboard.instantiateInitialViewController() {
      window?.rootViewController = initialViewController
    }
    
    window?.makeKeyAndVisible()
    
    EmulationCoordinator.shared().isExternalDisplayConnected = true
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
    EmulationCoordinator.shared().isExternalDisplayConnected = false
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    //
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
    //
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    //
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    //
  }
}
