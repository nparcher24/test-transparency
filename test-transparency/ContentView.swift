//
//  ContentView.swift
//  test-transparency
//
//  Created by Nicholas Parrish on 7/6/22.
//

import SwiftUI
import AVKit
import SpriteKit

struct ContentView: View {
    @State var mscene = SKScene()
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                Spacer()
                SpriteView(scene: mscene)
                Spacer()
            }.onAppear {
                let scene = SKScene(size: .init(width: 1000, height: 600))
                scene.size = CGSize(width: 1000, height: 600)
                scene.scaleMode = .aspectFit
                scene.backgroundColor = .clear
                scene.view?.allowsTransparency = true
                let player = AVPlayer(url:  Bundle.main.url(forResource: "output", withExtension: "mov")!)
                let video = SKVideoNode(avPlayer: player)
                video.size = CGSize(width: scene.size.width, height: scene.size.height)
                video.anchorPoint = .init(x: 0, y: 0)
                player.play()
                scene.addChild(video)
                mscene = scene
            }
            Spacer()
        }.background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
