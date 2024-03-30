import Foundation

// Struktur data untuk menyimpan informasi kontak
struct Contact {
    let name: String
    let phoneNumber: String
}

// Database kontak
let contactDatabase: [Contact] = [
    Contact(name: "dr. Mega", phoneNumber: "08143234534"),
    Contact(name: "dr. Anwar", phoneNumber: "110"),
    Contact(name: "dr. Saipul", phoneNumber: "113"),
    // Tambahkan kontak lain jika diperlukan
]

