//
//  ContactDetailsView.swift
//  smth
//
//  Created by User on 5/21/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct ContactDetailsView: View {
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
                
                HStack {
                    Image(systemName: "paperplane")
                        .foregroundColor(.white)
                        .padding(.all)
                        .padding(.leading)
                    Text("someemeial@abv.bg")
                        .foregroundColor(.white)
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1)
                        .opacity(0.1))
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.white)
                        .padding(.all)
                        .padding(.leading)
                    Text("+31 31313131212")
                        .foregroundColor(.white)
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1)
                        .opacity(0.1))
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                
                HStack {
                    HStack {

                        VStack(alignment: .leading) {

                            Text("Overdue expenses")
                                .foregroundColor(.white)
                            Text("01.01.2021 - 31.01.2021")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        Spacer()
                        Text("250$")
                            .foregroundColor(.white)
                    }
                    .padding(.all)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1)
                            .opacity(0.1))
                    .padding(.leading)
                    .padding(.trailing)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "paperplane.fill")
                    }.foregroundColor(.white)
                        .padding(.all)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1)
                            .opacity(0.1))
                    
                }.padding(.trailing)
                
                
                HStack {
                    VStack(alignment: .leading) {

                        Text("Projected expenses")
                            .foregroundColor(.white)
                        Text("01.01.2021 - 31.01.2021")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    Spacer()
                    Text("250$")
                        .foregroundColor(.white)
                }
                .padding(.all)
                 .overlay(
                     RoundedRectangle(cornerRadius: 16)
                         .stroke(Color.white, lineWidth: 1)
                         .opacity(0.1))
                 .padding(.leading)
                 .padding(.trailing)
                
                Divider().background(Color.white).padding(.leading).padding(.trailing)
                
                HStack {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(.all)
                        .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("Azure subscription - 1350$")
                            .foregroundColor(.white)
                        
                        Text("Azure subscription - 1350$")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .padding(.all)
                     .overlay(
                         RoundedRectangle(cornerRadius: 16)
                             .stroke(Color.white, lineWidth: 1)
                             .opacity(0.1))
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(.all)
                        .padding(.leading)
                        .opacity(0)
                    
                    VStack(alignment: .leading) {
                        Text("Azure subscription - 1350$")
                            .foregroundColor(.white)
                        
                        Text("Azure subscription - 1350$")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .padding(.all)
                     .overlay(
                         RoundedRectangle(cornerRadius: 16)
                             .stroke(Color.white, lineWidth: 1)
                             .opacity(0.1))
                    Spacer()
                }
            }
        }
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView()
    }
}
