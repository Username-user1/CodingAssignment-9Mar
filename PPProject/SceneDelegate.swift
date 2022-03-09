//
//  SceneDelegate.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }


        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()

        self.window = window
        window.rootViewController =  navController
        window.makeKeyAndVisible()
    }
}

