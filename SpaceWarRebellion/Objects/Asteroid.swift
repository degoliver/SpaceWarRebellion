//
//  Asteroid.swift
//  CocosSwift
//
//  Created by Anderson Ferreira on 29/02/16.
//  Copyright © 2016 Flameworks. All rights reserved.
//

class Asteroid:CCSprite{
    var damage:CGFloat = 25.0
    var life:CGFloat = 100.0
    var gameSceneRef:GameScene?
    
    override init() {
        super.init()
    }
    
    override init(CGImage image: CGImage!, key: String!) {
        super.init(CGImage: image, key: key)
    }
    
    override init(spriteFrame: CCSpriteFrame!) {
        super.init(spriteFrame: spriteFrame)
    }
    
    override init(texture: CCTexture!) {
        super.init(texture: texture)
    }
    
    override init(texture: CCTexture!, rect: CGRect) {
        super.init(texture: texture, rect: rect)
    }
    
    override init(texture: CCTexture!, rect: CGRect, rotated: Bool) {
        super.init(texture: texture, rect: rect, rotated: rotated)
    }
    
    override init(imageNamed imageName: String!) {
        super.init(imageNamed: imageName)
        
        self.rotation = 180.0
        
        self.physicsBody = CCPhysicsBody(rect: CGRectMake(0, 0, self.contentSize.width, self.contentSize.height), cornerRadius: 0.0)
        self.physicsBody.type = CCPhysicsBodyType.Kinematic
        self.physicsBody.friction = 1.0
        self.physicsBody.elasticity = 0.1
        self.physicsBody.mass = 100.0
        self.physicsBody.density = 100.0
        self.physicsBody.collisionType = "Asteroid"
        self.physicsBody.collisionCategories = ["Asteroid"]
        self.physicsBody.collisionMask = ["PlayerShip", "PlayerShot"]
        
        self.criarFogo()
    }
    
    //função responsável pela geração do fogo dos asteroids.
    func criarFogo(){
        let asteroidFire:CCParticleSystem = CCParticleSystem(file: "turbina2.plist")
        asteroidFire.scale = 2.0
        asteroidFire.position = CGPoint(x: self.contentSize.width/2, y: self.contentSize.width/2)
        self.addChild(asteroidFire, z:ObjectsLayers.turbina.rawValue)
    }
    
    //Cria particulas da destruição do asteroid
    func createAsteroidDestructionParticle(asteroidPosition: CGPoint) {
        let particle:CCParticleSystem = CCParticleSystem(file: "boom3.plist")
        particle.position = self.position
        particle.autoRemoveOnFinish = true
        self.addChild(particle, z:ObjectsLayers.Player.rawValue)
    }
    
    override func onEnter() {
        super.onEnter()
    }
    
    deinit {
        
    }
}
