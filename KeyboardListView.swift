//
//  KeyboardListView.swift
//  KeebLog
//
//  Created by Casey Thatsanaphonh on 12/8/21.
//

// TODO: Add detail navigation link and create another view

import SwiftUI

struct KeyboardListView : View {
    @ObservedObject var keebDB = KeyboardRepo.get()
    
        var body: some View {
        NavigationView{
            List(keebDB.getKeyboard(), id: \.id) { k in
                NavigationLink(destination: KeyboardDetalView(name: k.nameOfKeeb, switches: k.keebSwitch, cost: k.costOfKeeb), label: {
                    HStack {
                        Image("default-keeb")
                            .resizable()
                            .scaledToFit()
                            .frame(height : 70)
                            .cornerRadius(4)
                            .padding(0.5)


                        Text(k.nameOfKeeb)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                })
            }
            .navigationTitle("Keyboard Builds")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: BuildContentView(readOnlyMode: false), label: {
                        Label("Add Button", systemImage: "plus.circle.fill")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardListView()
    }
}
