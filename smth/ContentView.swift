//
//  ContentView.swift
//  smth
//
//  Created by User on 5/19/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications
struct ContentView: View {
    @State private var showalert = false
    @State private var isShowingScanner = false
    @State private var successCodeScan = false
    @State private var showContacts = false
    @State private var notifications = false
    @State private var showContactAlert = false
    
    var body: some View {
        NavigationView {

            VStack(spacing: 0) {

                Color("PrimaryColor").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        Color("PrimaryColor").frame(height: 250)
                        VStack {
                            HStack {
                                Text(self.successCodeScan ? "My Company" : "Company Name")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()

                                Toggle("",isOn: $notifications)
                                    .onReceive([self.notifications].publisher.first()) {
                                        (value) in
                                        if value {
                                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                                if success {
                                                   self.notifications = true
                                                    self.callNotification()
                                                    print("All set!")
                                                } else if let error = error {
                                                    print(error.localizedDescription)
                                                }
                                            }
                                        }
                                }
                                .disabled(!successCodeScan)
                                
                                Image(systemName: self.notifications ? "bell.fill" : "bell.slash").foregroundColor(Color.white)
                            }.padding(.trailing)
                            HStack {
                                Text(self.successCodeScan ? "20 charges overdue" : "")

                                    .fontWeight(.light)
                                    .foregroundColor(.red)
                                    .padding(.leading)
                                Spacer()
                            }
                            HStack {
                                Text(self.successCodeScan ? "5 upcoming charges" : "")
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

                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.white, lineWidth: 1)
                                            .opacity(0.1))

                                        .background(RoundedRectangle(cornerRadius: 16).fill(Color("OverviewButtonColor")))
                                    .alert(isPresented: $showalert) {
                                        Alert(title: Text("Prototype version"), message: Text("Sorry, this feature isn't available at this moment"))
                                    }
                                
                                Button(action: {
                                    self.isShowingScanner = true
                                }) {
                                    Image(systemName: self.successCodeScan ? "link.icloud.fill" : "xmark.icloud.fill")
                                    Text(self.successCodeScan ? "Connected" : "Connect")
                                }.foregroundColor(.white)
                                    .padding(.all)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.black).opacity(0.4))
                                    .sheet(isPresented: $isShowingScanner) {
                                        CodeScannerView(codeTypes: [.qr], simulatedData: "Some info and email", completion: self.handleScan)
                                }
                                Spacer()
                            }
                            .padding(.leading)
                            .padding(.top)
                            
                            if(self.successCodeScan) {
                                HStack {
                                    Text("Sucessfully linked desktop application!")
                                          .foregroundColor(.white)
                                          .padding(.leading)
                                        .padding(.top)
                                      Spacer()
                                }
                            }
                        }
                    }
                    NavigationLink(destination: ContactRow(), isActive: $showContacts)
                    {
                        EmptyView()
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
                        .onTapGesture {
                            if(!self.successCodeScan) {
                                self.showContactAlert = true
                            }
                            else {
                                self.showContacts = true
                            }
                    }
                    .alert(isPresented: $showContactAlert) {
                        Alert(title: Text("No connection to desktop"), message: Text("You must connect to the PC application first before proceeding!"))
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
    
    func callNotification() {

        let content = UNMutableNotificationContent()
        content.title = "Company name"
        content.subtitle = "You have 20 overdue charges"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false

        switch result {
        case .success:
            self.successCodeScan = true
            print("Successfully linked to the desktop application")
        case .failure:
            print("Scan failed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
