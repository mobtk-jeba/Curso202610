//
//  CheckinVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

import UIKit
import MapKit
import SVProgressHUD


class CheckinVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!

    let locationManager = CLLocationManager()
    let ubicaciones:[Ubicacion] = [
        Ubicacion(name: "Universidad Nacional Autónoma de México", lat: 19.313790325162426, lon: -99.18327018180128),
        Ubicacion(name: "Instituto Politécnico Nacional", lat: 19.498569562522736, lon: -99.13528886070802),
    ]


    //MARK: Functions

    func mostrarUbicaciones() {
        for ubicacion in ubicaciones {
            let annotation = MKPointAnnotation()
            annotation.title = ubicacion.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: ubicacion.lat, longitude: ubicacion.lon)
            self.mapa.addAnnotation(annotation)
        }
    }

    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Access granted")
            mapa.showsUserLocation = true
        case .denied, .restricted:
            SVProgressHUD.showError(withStatus: "Debes permitir el acceso a la ubicación de tu dispositivo")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            print("Unknown")
        }
    }



    //MARK: Actions

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


    //MARK: Delegates

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location: \(locations)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Authorization: \(status)")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            self.mapa.showsUserLocation = true
        }else{
            self.mapa.showsUserLocation = false
        }
    }



    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        mostrarUbicaciones()
        checkAuthorizationStatus()
        locationManager.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let center = CLLocationCoordinate2D(latitude: 19.43, longitude: -99.14)
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapa.setRegion(region, animated: true)
    }

}
