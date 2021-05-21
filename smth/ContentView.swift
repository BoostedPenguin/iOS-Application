//
//  ContentView.swift
//  smth
//
//  Created by User on 5/19/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showalert = false
    var body: some View {
        VStack(spacing: 0) {

            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ZStack {
                    Color("PrimaryColor").frame(height: 250)
                    VStack {
                        HStack {
                            Text("Company name")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            Button(action: {
//                                print("aw")
                            }) {
                                Image(systemName: "pencil")
                            }.foregroundColor(.white)
                                .padding(.all)
                                .background(Color.black)
                        }.padding(.trailing)
                        HStack {
                            Text("20 charges overdue")

                                .fontWeight(.light)
                                .foregroundColor(.red)
                                .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Text("5 upcoming charges")
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Button("Overview") {
                                self.showalert = true
                                }.padding(.all)
                                .foregroundColor(.white)
                                .background(Color("OverviewButtonColor"))
                                .alert(isPresented: $showalert) {
                                    Alert(title: Text("Prototype version"), message: Text("Sorry, this feature isn't available at this moment"))
                                }
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top)
                    }
                }
                ZStack {
                    Color("MainContactsBackground").frame(height: 180)
                    HStack {
                        Text("Contacts")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(20)
                        Spacer()
                        Image("ContactsImage").resizable()
                    }

                }
                ZStack {
                    Color("MainUpcomingChargesBackground").frame(height: 180)
                    HStack {
                        Text(" Charges")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(20)
                        Spacer()
                        Image("ChargesImage").resizable()
                    }
                }
                .onTapGesture {
                    self.showalert = true
                }.alert(isPresented: $showalert) {
                    Alert(title: Text("Prototype version"), message: Text("Sorry, this feature isn't available at this moment"))
                }
                ZStack {
                    Color("MainPaymentHistoryBackground").frame(height: 180)
                    HStack {
                        Text("   History")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(20)
                        Spacer()
                        Image("PaymentImage").resizable()
                    }
                }
                .onTapGesture {
                    self.showalert = true
                }.alert(isPresented: $showalert) {
                    Alert(title: Text("Prototype version"), message: Text("Sorry, this feature isn't available at this moment"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
