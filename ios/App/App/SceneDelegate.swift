import Foundation
import UIKit
import os

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    internal var window: UIWindow?
    
    // MARK: UISceneDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene,
              session.configuration.name == "AppSceneConfiguration" else { return }
        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateInitialViewController()
        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
        
        // NOTES FOR THE IONIC TEAM
        // Adding this to replicate the receention of a scene getting called again in a low memory case
        // After letting the app run for a while then it crashes in CapacitorBridge.registerPlugins
        // Can take a little while to crash, seems random in timing
        let seconds = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.scene(scene, willConnectTo: session, options: connectionOptions);
        }
    }
}
