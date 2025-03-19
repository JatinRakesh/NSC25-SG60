import SwiftUI

struct ContentView: View {
    var body: some View {
        // TabView for navigation
        TabView {
            // Home Tab
            NavigationView {
                ZStack {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        // Welcome bar at the top
                        VStack {
                            HStack {
                                Text("Welcome, username")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                // Gear icon wrapped in a NavigationLink as a button
                              
                            }
                            .background(Color(red: 236/255, green: 25/255, blue: 58/255)) // Set background color to #ec193a
                            .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 20)  // Push everything down a bit to avoid the status bar
                        
                        // Placeholder box with image, description, and link
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 200)
                                    .padding()
                                
                                VStack {
                                    // Placeholder image
                                    Image("Photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(.bottom, 10)
                                    
                                    // Placeholder description with maxHeight to avoid overflowing
                                    Text("The $100 will be given to each Singaporean for the purchase of SingLit books")
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 10)
                                        .padding(.trailing, 10)
                                        .lineLimit(3) // Restrict to 3 lines
                                        .truncationMode(.tail) // Add ellipsis at the end if the text overflows
                                    
                                    // Placeholder link
                                    Link("Article link", destination: URL(string: "https://www.straitstimes.com/singapore/politics/sg-culture-pass-can-be-used-for-singlit-books-cannot-be-donated-to-arts-charities")!)
                                        .font(.headline)
                                        .foregroundColor(Color(red: 236/255, green: 25/255, blue: 58/255)) // Same color as the bar
                                }
                                .padding(10) // Padding for content inside the box
                            }
                        }
                        
                        // Grid of NiceRect shapes
                        VStack {
                            ForEach(0..<2, id: \.self) { row in
                                HStack {
                                    ForEach(0..<2, id: \.self) { column in
                                        ZStack {
                                            NiceRect()
                                                .scaledToFill()
                                                .scaledToFit()
                                                .padding()
                                                .foregroundStyle(Color(red: 236/255, green: 25/255, blue: 58/255))
                                                .frame(width: 200, height: 200)
                                            Text(row == 0 && column == 0 ? "Chinese" :
                                                    row == 0 && column == 1 ? "Malay" :
                                                    row == 1 && column == 0 ? "Indian" : "Others")
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .bold()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
      
        }
    }
}

struct NiceRect: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99566*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.50222*width, y: height), control1: CGPoint(x: 0.99566*width, y: height), control2: CGPoint(x: 0.77959*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.5*height), control1: CGPoint(x: 0.22485*width, y: height), control2: CGPoint(x: 0, y: height))
        path.addCurve(to: CGPoint(x: 0.50222*width, y: 0), control1: CGPoint(x: 0, y: 0.1925*height), control2: CGPoint(x: 0.07282*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.99566*width, y: 0.5*height), control1: CGPoint(x: 0.93162*width, y: 0), control2: CGPoint(x: 0.99566*width, y: 0.20125*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}
