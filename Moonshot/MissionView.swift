//
//  MissionView.swift
//  Moonshot
//
//  Created by noor on 2/27/25.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role : String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        self.astronauts = astronauts
        self.crew = mission.crew.map { crewRole in
            if let astronaut = astronauts[crewRole.name] {
                return CrewMember(role:crewRole.role, astronaut: astronaut)
            } else {
                fatalError("Invalid data found!")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(mission.missionImage)
                        .resizable()
                        .scaledToFill()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)

                    VStack(alignment: .leading) {
                        Rectangle()
                            .background(.lightBackground)
                            .frame(height: 1)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .background(.lightBackground)
                            .frame(height: 1)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                       
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id:\.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 104, height: 72)
                                            .clipShape(.capsule)
                                            .overlay {
                                                Capsule()
                                                    .stroke(.white)
                                            }
                                            
                                        VStack (alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .font(.headline.bold())
                                                .foregroundColor(.white)
                                            Text(crewMember.role)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.missionTitle)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
