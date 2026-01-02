import Foundation

struct Property: Identifiable {
    let id = UUID()
    let title: String
    let address: String        // Hata burada: 'location' yerine 'address' kullanıyoruz
    let price: String
    let totalContentPrice: String
    let monthlyExpenses: String
    let area: String
    let bedrooms: String
    let type: String
    let description: String    // Detay sayfası için gerekli
    let imageName: String
    let viewingStatus: String
}
