//
//  ViewController.swift
//  mkMapView
//
//  Created by 廖昱晴 on 2021/3/3.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude: CLLocationDegrees = 48.858547 //緯度
        let longitude: CLLocationDegrees = 2.294524 //經度
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude) //座標
        let xScale: CLLocationDegrees = 0.01 //x方向放大比例，數字越小地圖越大，1為原尺寸不放大
        let yScale: CLLocationDegrees = 0.01 //y方向放大比例，數字越小地圖越大，1為原尺寸不放大
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale) //地圖縮放比例
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span) //要顯示的區域
        map.setRegion(region, animated: true)
        
        
    }

    @IBAction func addAnnotation(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: map) //手指在地圖上長按的點
        let touchCoordinate: CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: map) //將點轉換為座標
        let annotation = MKPointAnnotation() //產生大頭針
        annotation.coordinate = touchCoordinate //大頭針座標
        annotation.title = "New Place" //標題
        annotation.subtitle = "One Day I wanna be here" //副標題
        map.addAnnotation(annotation)
        
    }
    
}

