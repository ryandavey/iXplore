//
//  ViewController.swift
//  iXplore
//
//  Created by Ryan Davey on 6/8/16.
//  Copyright © 2016 Ryan Davey. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var spotList: [Spot] = Spot.spotList()
    
    func
        setupMapView () {
        self.mapView.mapType = .Hybrid
    }
    
    func setupTableView () {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //tableView.registerNib(UINib(nibName: "SpotTableViewCell", bundle: nil))
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let spot = spotList[indexPath.row]
        
        let mapCenterCoordinateAfterMove = CLLocationCoordinate2D(latitude: self.spotList[indexPath.row].coordinate.latitude,longitude: self.spotList[indexPath.row].coordinate.longitude)
        let adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMake(mapCenterCoordinateAfterMove,
            MKCoordinateSpanMake(0.01, 0.01)))
        mapView.setRegion(adjustedRegion, animated: true)
        mapView.addAnnotation(spot)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spotList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.spotList[indexPath.row].title
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupMapView()
        setupTableView()
    }

    //func tableView(tableView)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

