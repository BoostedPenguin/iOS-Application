//
//  ContactRow.swift
//  smth
//
//  Created by User on 5/22/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var result: [Contact]
}

struct Contact: Codable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var overdueExpenses: Int
    var overdueExpensesDate: String
    var projectedExpenses: Int
    var projectedExpensesDate: String
    var payments: Array<Payments>
}

struct Payments: Codable {
    var historyID: Int
    var contactID: Int
    var title: String
    var paymentDate: String
    var paid: Bool
    var amount: Int
}



struct ContactRow: View {
    @State private var contacts = [Contact]()
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            

            
            List(contacts, id: \.id) {
                item in VStack(alignment: .leading) {
                    HStack {
                        Text(item.name)
                        Spacer()
                        NavigationLink(destination: ContactDetailsView(contact: item)) {
                              Text("")
                          }
                    }
                }
            }
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://pwaapplication.azurewebsites.net/api/contact") else {
            print("Wrong URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            // continue
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        print(decodedResponse.result)
                        self.contacts = decodedResponse.result
                    }

                    // everything is good, so we can exit
                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow()
    }
}
