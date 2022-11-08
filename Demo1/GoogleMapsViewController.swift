//
//  GoogleMapsViewController.swift
//  Demo1
//
//  Created by Vishal Jagtap on 04/11/22.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        drawRectangle()
        polygon()
        addCircle()
        
        let camera = GMSCameraPosition(latitude: 18.5091, longitude: 73.8327, zoom: 10.0)
        mapView.camera = camera
        
        showMarker(position: camera.target)
        mapView.mapType = GMSMapViewType.normal
        
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.scrollGestures = true
        mapView.settings.myLocationButton = true
        mapView.settings.tiltGestures = true
            
       // mapView.settings.setAllGesturesEnabled(true)
    }
    
    func showMarker(position : CLLocationCoordinate2D){
        
        marker.position = position
        marker.isDraggable = true
        marker.title = "BitCode Technologies"
        marker.snippet = "Training Institute"
        marker.map = mapView
        
    }
}

extension GoogleMapsViewController : GMSMapViewDelegate{

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("Did Tap Info Window Called")
    }
    
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("Did Long Press Info Window Called")
    }
    
    //Info window -- on your mapView
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 150, height: 75))
        view.backgroundColor = UIColor.magenta
        view.alpha = 0.2
        view.layer.cornerRadius = 4
        
        //Creating Label on mapView
        let label1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 15, height: 20))
            
        label1.text = "Bitcode"
        label1.backgroundColor = UIColor.purple
        label1.textColor = UIColor.white
        view.addSubview(label1)
        
        return view
    }
    
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("The method did Begin Dragging Called\(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("Did Drag called\(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Did End Dragging Called \(marker.position)")
    }
    
    
    func drawRectangle(){
        let pathForRectWithPolyLine = GMSMutablePath()
        pathForRectWithPolyLine.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.86))
        pathForRectWithPolyLine.add(CLLocationCoordinate2D(latitude: 19.078, longitude: 72.87))
        pathForRectWithPolyLine.add(CLLocationCoordinate2D(latitude: 19.9954, longitude: 73.7924))
        pathForRectWithPolyLine.add(CLLocationCoordinate2D(latitude: 19.095, longitude: 74.750))
        pathForRectWithPolyLine.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.86))
        
        let rectWithPolyline = GMSPolyline(path: pathForRectWithPolyLine)
        rectWithPolyline.strokeColor = UIColor.white
        rectWithPolyline.strokeWidth = 6
        rectWithPolyline.title = "PolyLine Drawing"
        rectWithPolyline.map = mapView
    }
    
    func polygon(){
        let solidRectanglePath = GMSMutablePath()
        solidRectanglePath.add(CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))
        solidRectanglePath.add(CLLocationCoordinate2D(latitude: 17.3850, longitude: 78.4867))
        solidRectanglePath.add(CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707))
        solidRectanglePath.add(CLLocationCoordinate2D(latitude: 12.97, longitude: 77.59))
        
        
        let polygon = GMSPolygon(path: solidRectanglePath)
        polygon.fillColor = UIColor(red: 0.25, green: 0, blue: 0, alpha: 0.8)
        polygon.strokeWidth = 10
        polygon.strokeColor = UIColor.blue
        polygon.map = mapView
    }
    
    func addCircle(){
        let circleCenter = CLLocationCoordinate2D(latitude: 18.5091, longitude: 73.8327)
        let circle = GMSCircle(position: circleCenter, radius: 2000)
        circle.map = mapView
        circle.fillColor = UIColor.brown
        circle.strokeColor = UIColor.cyan
        circle.strokeWidth = 5
    }
    
}
