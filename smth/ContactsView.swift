//
//  ContactsView.swift
//  smth
//
//  Created by User on 5/22/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Name")
                        .font(.title)
                        .padding(.all)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
