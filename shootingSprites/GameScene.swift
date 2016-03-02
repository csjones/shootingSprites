//
//  GameScene.swift
//  shootingSprites
//
//  Created by Chris on 3/2/16.
//  Copyright (c) 2016 csjones. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    private var radius: Float = 0

    private var midPoint: CGPoint?

    private weak var mainSprite: SKSpriteNode?

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let midPoint = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

        self.radius = Float(self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width ) / 4

        let sprite = SKSpriteNode(imageNamed:"Spaceship")

        sprite.xScale = 0.1
        sprite.yScale = 0.1
        sprite.position = midPoint

        self.mainSprite = sprite
        self.midPoint = midPoint
        
        self.addChild(sprite)

        for var i = 0; i < 12; i++ {
            let enemy = SKSpriteNode(imageNamed:"Spaceship")

            enemy.xScale = 0.05
            enemy.yScale = 0.05

            let midX: Float = Float(midPoint.x)
            let midY: Float = Float(midPoint.y)

            let first = midX + cosf(Float(2) * Float(i) * Float(M_PI) / Float(12)) * self.radius
            let second = midY + sinf(Float(2) * Float(i) * Float(M_PI) / Float(12)) * self.radius

            enemy.position = CGPointMake( CGFloat(first), CGFloat(second) )

            self.addChild(enemy)
        }
    }

    func fireWithPoint(firePoint: CGPoint) {
        guard let midPoint = self.midPoint, firePoint = self.convertPointFromView(firePoint) as CGPoint? else {
            return
        }

        let angle = atan2f(Float(firePoint.y - midPoint.y), Float(firePoint.x - midPoint.x))

        let action = SKAction.rotateByAngle(CGFloat(angle) * CGFloat(M_PI), duration:1)

        mainSprite?.runAction(action)
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
