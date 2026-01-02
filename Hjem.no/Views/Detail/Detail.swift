import SwiftUI

struct DetailView: View {
    let property: Property
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Görsel Alanı
                ZStack(alignment: .topLeading) {
                    Image(property.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    // Geri Butonu
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .padding(10)
                            .background(Color.white.opacity(0.8))
                            .clipShape(Circle())
                            .foregroundColor(.black)
                    }
                    .padding(.top, 50)
                    .padding(.leading, 20)
                }

                VStack(alignment: .leading, spacing: 20) {
                    // Adres ve Başlık
                    VStack(alignment: .leading, spacing: 8) {
                        Text(property.address.uppercased()) // .location yerine .address
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        
                        Text(property.title)
                            .font(.title2)
                            .fontWeight(.bold)
                    }

                    // Fiyat Bilgisi
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Prisantydning")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(property.price)
                                .font(.title3)
                                .fontWeight(.black)
                        }
                        Spacer()
                    }

                    Divider()

                    // Diğer Detaylar
                    HStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("Areal").font(.caption).foregroundColor(.secondary)
                            Text(property.area).fontWeight(.bold)
                        }
                        VStack(alignment: .leading) {
                            Text("Soverom").font(.caption).foregroundColor(.secondary)
                            Text(property.bedrooms).fontWeight(.bold)
                        }
                        VStack(alignment: .leading) {
                            Text("Boligtype").font(.caption).foregroundColor(.secondary)
                            Text(property.type).fontWeight(.bold)
                        }
                    }

                    Divider()

                    Text("Beskrivelse")
                        .font(.headline)
                    
                    Text(property.description)
                        .font(.body)
                        .foregroundColor(.primary.opacity(0.8))
                }
                .padding(20)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
