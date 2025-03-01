//
//  AstronautView.swift
//  Moonshot
//
//  Created by noor on 2/28/25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
   
                VStack (alignment: .leading) {
                    Text(astronaut.name)
                        .font(.title.bold())
                        .padding(.bottom)
                        .foregroundStyle(.white)
                    Text(astronaut.description)
                        .foregroundStyle(.white)
                }
                .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["grissom"]!)
        .preferredColorScheme(.dark)
}
