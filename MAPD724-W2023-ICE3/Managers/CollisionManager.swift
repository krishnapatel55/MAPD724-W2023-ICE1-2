//
//  CollisionManager.swift
//  MAPD724-W2023-ICE3
//
//  Created by Kisu on 2023-02-04.
//

import GameplayKit
import SpriteKit

class CollisionManager {
    //get a reference to the GameViewController
    public static var gameViewController : GameViewController?
    
    //Utility Functions
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    //Collision Function
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject){
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radi = P1Radius + P2Radius
        
        // the collision check - overlapping circles
        if(SquaredDistance(point1: P1, point2: P2) < Radi * Radi){
            //we have a collision
            if(!object2.isColliding!){
                //if object2 is not already colliding
                switch(object2.name){
                case "island":
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    break
                case "cloud":
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
