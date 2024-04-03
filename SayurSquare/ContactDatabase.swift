// ContactDatabase.swift
import Foundation

// Struktur data untuk menyimpan informasi kontak
struct Contact {
    let name: String
    let phoneNumber: String
    let latitude: Double // Menambahkan latitude untuk koordinat dokter
    let longitude: Double // Menambahkan longitude untuk koordinat dokter
    let address: String
}

// Database kontak
let contactDatabase: [Contact] = [
//    Contact(name: "dr. Mega", phoneNumber: "08143234534", latitude: -6.200000, longitude: 106.816666, address: "Stasiun Karet"),
//    Contact(name: "dr. Anwar", phoneNumber: "110", latitude: -6.2088, longitude: 106.8456, address: "AEON gate 2"),
//    Contact(name: "dr. Saipul", phoneNumber: "113", latitude: -6.2146, longitude: 106.8451, address: "GOP 9 Apple DEV"),
    // Tambahkan kontak lain jika diperlukan
    
    Contact(name: "dr. Mega", phoneNumber: "08143234534", latitude: 37.33683, longitude: -122.01218, address: "Stasiun Karet"),
    Contact(name: "dr. Anwar", phoneNumber: "110", latitude: 37.33581, longitude: -122.01230, address: "AEON gate 2"),
    Contact(name: "dr. Saipul", phoneNumber: "113", latitude: 37.33446, longitude: -122.01188, address: "GOP 9 Apple DEV"),
]
    
