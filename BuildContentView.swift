//
//  BuildContentView.swift
//  KeebLog
//
//  Created by Casey Thatsanaphonh on 12/9/21.
//

import SwiftUI

var keebRepo = KeyboardRepo.get()

struct BuildContentView : View {
    @State var kName : String = ""
    @State var kCost : String = ""
    @State var kSwitch : String = ""
    var readOnlyMode : Bool
    var body : some View {
        VStack() {
            HStack(){
                Text("Keyboard:")
                    .frame(width: 85, alignment: .leading)
                    .font(.headline)
                TextField("Enter Keyboard Name", text: $kName)
                    .border(Color.black)
                    .disabled(readOnlyMode)
                
            }
            HStack(){
                Text("Price:")
                    .frame(width: 85, alignment: .leading)
                    .font(.headline)
                TextField("Enter Dollar Amount", text: $kCost)
                    .border(Color.black)
                    .disabled(readOnlyMode)
            }
            HStack(){
                Text("Switch:")
                    .frame(width: 85, alignment: .leading)
                    .font(.headline)
                TextField("Enter Switch Name", text: $kSwitch)
                    .border(Color.black)
                    .disabled(readOnlyMode)
            }
            Button(action: {
                //print("Add button is clicked")
                let keyboardObj = Keyboard(name: kName, cost: Int(kCost)!, switchName: kSwitch)
                keebRepo.createKeyboard(keebObj: keyboardObj)
                //print("keyboard added: \(keyboardObj)")
                //print("\(keebRepo.sizeOfDB())")
                kName = ""
                kCost = ""
                kSwitch = ""
            }, label: {
                Text("add").padding(3)
                    .foregroundColor(.blue)
                    .font(.headline)
            }).disabled(readOnlyMode).frame(maxWidth: .infinity, alignment: .trailing).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            
            Spacer()
        }.padding(EdgeInsets(top: 30, leading: 10, bottom: 30, trailing: 10))
    }
}

struct BuildContentView_Preview: PreviewProvider {
    static var previews: some View {
        BuildContentView(readOnlyMode: true)
    }
}
