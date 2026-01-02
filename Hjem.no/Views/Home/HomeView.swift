import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    // Verileri modeldeki tüm parametreleri (description dahil) içerecek şekilde güncelledik
    let properties = [
        Property(
            title: "Moderne, lys og nyoppusset 3-roms i populært område. Stor uteplass, peis",
            address: "Kristoffer Eides vei 42, 2720 Gråberg",
            price: "7 500 000 kr",
            totalContentPrice: "7 791 223 kr",
            monthlyExpenses: "4 978 kr",
            area: "71m²",
            bedrooms: "2 soverom",
            type: "Eier (Selveier)",
            description: "Her får du en fantastisk mulighet til å sikre deg en nyoppusset og moderne 3-roms leilighet med attraktiv beliggenhet. Boligen har en åpen stue- og kjøkkenløsning, to romslige soverom og en solrik uteplass.",
            imageName: "h1",
            viewingStatus: "Visning etter avtale"
        ),
        Property(
            title: "Enebolig med panoramautsikt",
            address: "Osloveien 12, 0123 Oslo",
            price: "12 500 000 kr",
            totalContentPrice: "12 850 000 kr",
            monthlyExpenses: "3 200 kr",
            area: "150m²",
            bedrooms: "4 soverom",
            type: "Eier (Selveier)",
            description: "En unik enebolig over to plan med fantastisk utsikt over byen. Perfekt for barnefamilier med kort vei til skole og marka.",
            imageName: "h2",
            viewingStatus: "Visning søndag 14:00"
        )
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search Section (Arama Bölümü)
                VStack(spacing: 12) {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Søk på område eller adresse...", text: $searchText)
                        }
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(25)
                        
                        Image(systemName: "map")
                            .padding(10)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            FilterButton(title: "Velg område", icon: "location")
                            FilterButton(title: "Filter", icon: "slider.horizontal.3")
                            FilterButton(title: "Lagre søk", icon: "bookmark")
                        }
                    }
                }
                .padding()
                
                Divider()
                
                ScrollView {
                    HStack {
                        Text("\(properties.count) resultater")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .padding([.horizontal, .top])
                    
                    LazyVStack(spacing: 20) {
                        ForEach(properties) { property in
                            // NavigationLink ekleyerek detay sayfasına geçişi sağlıyoruz
                            NavigationLink(destination: DetailView(property: property)) {
                                PropertyCardView(property: property)
                            }
                            .buttonStyle(PlainButtonStyle()) // Mavi tıklama efektini kaldırır
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
struct FilterButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 14))
            Text(title)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
        .overlay(
            Capsule().stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .foregroundColor(.black)
    }
}
