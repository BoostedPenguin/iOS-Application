//
//  SwiftUIView.swift
//  smth
//
//  Created by User on 5/21/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var showAlert = false
    var body: some View {
//        NavigationView {
//            Text("Content")
//            .navigationBarTitle("content")
//                .navigationBarItems(leading: Button("Add") {
//                    print("content")
//                },
//                    trailing: Button("No") {
//                        print("Content")
//                })
//        }
        Button(action: {self.showAlert = true}) {
            VStack(spacing: 4) {
                Text("awe")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
