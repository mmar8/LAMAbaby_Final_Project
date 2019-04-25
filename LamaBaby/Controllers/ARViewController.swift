//
//  ARViewController.swift
//  LamaBaby
//
//  Created by Luke Phyall on 24/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // These next five lines set up the tracking images that the app is going to look for
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        print("Attempting to find tracking images")
        
        // Use an if let statement to check whether tracking images actually exist in the asset folder
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Targets", bundle: Bundle.main) {
            
            //Set our particular tracking image
            configuration.trackingImages = imageToTrack
            
            //Set the number of detected images that will experience an onscreen AR asset simultaneously
            configuration.maximumNumberOfTrackedImages = 1
            
            //Feedback to let you know the configuration succeeded
            print("If you're seeing this, your tracking images have been successful found")
            
        }
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        // Create a node
        let node = SCNNode()
        
        //Creates a cone to be used as a pointer
        let cone = SCNCone(topRadius: 0.1, bottomRadius: 0.0, height: 0.5)
        
        //creates a skin for the cone with a colour and assigns it to the geometry
        let material = SCNMaterial()
        
        material.diffuse.contents = UIColor.red
        
        cone.materials = [material]
        
        sceneView.autoenablesDefaultLighting = true
        
        //Use an if let to make sure the detected image actually is of type ARImageAnchor
        //The anchor it's using is the reference image we've already supplied
        if let imageAnchor = anchor as? ARImageAnchor {
            
            //Create a flat plane with the exact dimensions of the reference image
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            //Set the transparency of our plane to mostly see-through
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.9)
            
            //Create a plane node using the newly-defined plane
            let planeNode = SCNNode(geometry: plane)
            
            //Plane is created standing up off the anchor
            //Rotate it 90 degrees around the X axis so that our plane lies flat on our reference image
            planeNode.eulerAngles.x = -.pi/2
            
            //Adjust the position of the cone
            //planeNode.position = SCNVector3Make(0, -1, 0)
            
            //Stick our plane node onto the main node
            node.addChildNode(planeNode)
            
            node.geometry = cone
            
            
            
        }
        
        return node
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
