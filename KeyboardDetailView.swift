//
//  KeyboardDetailView.swift
//  KeebLog
//
//  Created by Casey Thatsanaphonh on 12/10/21.
//

import SwiftUI

struct KeyboardDetalView : View {
    
    var name : String
    var switches : String
    var cost : Int
    var body: some View {
        NavigationView{
            VStack(spacing : 10){
                Image("default-keeb")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .cornerRadius(12)
                    
                
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(switches)
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("$\(cost)")
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct KeyboardDetailView_Preview: PreviewProvider {
    static var previews: some View {
        KeyboardDetalView(name : "Name of Keyboard", switches: "Switches", cost: 100)
    }
}
