//
//  MapView.swift
//  SayurSquare
//
//  Created by Syafrie Bachtiar on 02/04/24.
//
//Untuk Subview map
// MapView.swift
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let userCoordinate: CLLocationCoordinate2D // Koordinat titik user
    let doctorCoordinate: CLLocationCoordinate2D // Koordinat dokter
    let doctorName: String // Nama dokter

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Menetapkan region peta dengan dokter dan titik user
        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = userCoordinate
        userAnnotation.title = "User"
        
        let doctorAnnotation = MKPointAnnotation()
        doctorAnnotation.coordinate = doctorCoordinate
        doctorAnnotation.title = doctorName
        
        let annotations = [userAnnotation, doctorAnnotation]
        uiView.removeAnnotations(uiView.annotations) // Menghapus semua annotation yang ada sebelumnya
        uiView.addAnnotations(annotations) // Menambahkan annotation baru
        
        let region = regionForAnnotations(annotations)
        uiView.setRegion(region, animated: true)
    }
    
    // Menghitung region yang mencakup semua annotations
    private func regionForAnnotations(_ annotations: [MKAnnotation]) -> MKCoordinateRegion {
        var minLatitude = Double.greatestFiniteMagnitude
        var maxLatitude = -Double.greatestFiniteMagnitude
        var minLongitude = Double.greatestFiniteMagnitude
        var maxLongitude = -Double.greatestFiniteMagnitude
        
        for annotation in annotations {
            let coordinate = annotation.coordinate
            minLatitude = min(minLatitude, coordinate.latitude)
            maxLatitude = max(maxLatitude, coordinate.latitude)
            minLongitude = min(minLongitude, coordinate.longitude)
            maxLongitude = max(maxLongitude, coordinate.longitude)
        }
        
        let center = CLLocationCoordinate2D(latitude: (minLatitude + maxLatitude) / 2, longitude: (minLongitude + maxLongitude) / 2)
        let span = MKCoordinateSpan(latitudeDelta: (maxLatitude - minLatitude) * 1.4, longitudeDelta: (maxLongitude - minLongitude) * 1.4)
        
        return MKCoordinateRegion(center: center, span: span)
    }
}
