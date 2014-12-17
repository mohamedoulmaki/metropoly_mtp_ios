//
//  ViewController.swift
//  Metropoly-Montpellier
//
//  Created by Mohamed on 25/11/2014.
//  Copyright (c) 2014 cymodean.io. All rights reserved.
//

//générale
import UIKit
import CoreLocation
//carte
import MapKit
//G+
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreMotion


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, GPPSignInDelegate {
    
    var mapview: MKMapView!
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    //G+
    var signIn:GPPSignIn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        mapview = MKMapView(frame: self.view.frame)
        mapview.delegate = self
        mapview.showsUserLocation = true
        let template = "http://188.226.187.180:49169/mtp/{z}/{x}/{y}.png";
        var overlay:MKTileOverlay = MKTileOverlay (URLTemplate: template)
        overlay.canReplaceMapContent = true;
        var level : MKOverlayLevel = MKOverlayLevel(rawValue: 1)!
        mapview.addOverlay(overlay, level: level)
        mapview.showsBuildings = false;
        self.view.addSubview(mapview)
        
        //initialisation de parse
        Parse.setApplicationId("j7EHBDp2Cz3C95oGRdi5fZ8WpbOCEMc4xD3RabtT", clientKey:"rhDWYZj0anFaM0ai0LqRNt6ZDtdtNOtjnPvlsRTA")
        //requête de récupération
        var query = PFUser.query()
        query.whereKey("username", equalTo:"momo")
        var momo = query.findObjects()
        
        NSLog("%@", momo)
        */
        /* ----------
            google+
        ---------- */
        
        //configuration google login
        signIn = GPPSignIn.sharedInstance()
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.clientID = "1083840439379-u5c7fjhjnqe67d1sqlb9vl4ep2doa4bu.apps.googleusercontent.com"
        signIn?.scopes = [kGTLAuthScopePlusLogin]
        signIn?.delegate = self
        signIn?.authenticate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKTileOverlay {
            var rfo = MKTileOverlayRenderer (overlay: overlay)
            return rfo
        }
        return nil
    }
    
    //Connexion avec G+
    func finishedWithAuth(auth:GTMOAuth2Authentication?, error:NSError?){
        print(auth)
    }
    func didDisconnectWithError(error: NSError?) {
    }
    
    
}


