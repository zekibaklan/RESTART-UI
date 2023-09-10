//
//  HomeView.swift
//  Restart
//
//  Created by Zeki Baklan on 3.09.2023.
//

import SwiftUI



struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = false
    @State private var isAnimating : Bool = false
    var body: some View {
        VStack {
            
   //MARK: - HEADER
        
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation.easeInOut(duration: 4)
                    .repeatForever(),
                    value: isAnimating)
            }
        
        //MARK: - CENTER
        
        Text("The time that leads to mastery is dependent on the instensity of our focus.")
            
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
                
                 //MARK: - FOOTER
    
            Spacer()

                Button {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                        isAnimating = true
                    })
                        
                    
                })
          
        }//: VSTACK
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
