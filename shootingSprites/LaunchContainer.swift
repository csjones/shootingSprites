//
//  LaunchContainer.swift
//  shootingSprites
//
//  Created by Chris on 3/2/16.
//  Copyright © 2016 csjones. All rights reserved.
//

import UIKit
import SpriteKit


class LaunchContainer: UIViewController {

    private weak var spriteScene: GameScene?

    @IBOutlet weak var spriteView: SKView!

    @IBAction func didTapGameView(sender: UITapGestureRecognizer) {
        guard let spriteScene = self.spriteScene else {
            return
        }

        let mker = sender.locationInView( spriteView )

        spriteScene.fireWithPoint( mker )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let scene = GameScene(size: spriteView.bounds.size) as GameScene? {
            // Configure the view.
            spriteView.showsFPS = true
            spriteView.showsNodeCount = true
            spriteView.showsDrawCount = true

            /* Sprite Kit applies additional optimizations to improve rendering performance */
            spriteView.ignoresSiblingOrder = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            self.spriteScene = scene

            spriteView.presentScene(scene)
        }
    }
    

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
