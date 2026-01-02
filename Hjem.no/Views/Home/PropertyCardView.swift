import SwiftUI

struct PropertyCardView: View {
    let property: Property
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Görsel Alanı
            ZStack(alignment: .topLeading) {
                Image(property.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 220)
                    .clipped()
                    .cornerRadius(12)
                
                // Visning Badge
                Text(property.viewingStatus)
                    .font(.system(size: 12, weight: .medium))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(10)
                
                // Favorite Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "heart")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(10)
                    }
                }
            }
            
            // Bilgiler
            VStack(alignment: .leading, spacing: 6) {
                Text(property.title)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                
                Text(property.address)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(property.price)
                        .font(.system(size: 18, weight: .black))
                    
                    HStack(spacing: 4) {
                        Text("Totalpris: \(property.totalContentPrice)")
                        Text("•")
                        Text("Fellesutg: \(property.monthlyExpenses)")
                    }
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
                
                HStack {
                    Text("\(property.area) • \(property.bedrooms) • Annet • \(property.type)")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 4)
        }
        .padding(.bottom, 20)
    }
}
