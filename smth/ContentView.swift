//
//  ContentView.swift
//  smth
//
//  Created by User on 5/19/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!").bold().underline().padding()
            Text("Content").padding()
            
            HStack {
                Text("Horizontal")
                Spacer()
                Text("Content")
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
