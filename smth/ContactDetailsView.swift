//
//  ContactDetailsView.swift
//  smth
//
//  Created by User on 5/21/21.
//  Copyright © 2021 User. All rights reserved.
//

import SwiftUI

struct ContactDetailsView: View {
    var contact: Contact
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(contact.name)
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
                    Text(contact.email)
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
                    Text(contact.phone)
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
                            Text("\(contact.overdueExpensesDate)")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(contact.overdueExpenses)$")
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
                        Text("\(contact.projectedExpensesDate)")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(contact.projectedExpenses)$")
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
                
                ForEach(contact.payments, id: \.historyID) { item in

                    VStack {
                        if(item.paid) {

                            HStack {
                                Image(systemName: "pencil")
                                    .foregroundColor(.white)
                                    .padding(.all)
                                    .padding(.leading)
                                    .opacity(0)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .foregroundColor(.white)
                                    
                                    Text(item.paymentDate)
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
                        else {

                            HStack {
                                Image(systemName: "pencil")
                                    .foregroundColor(.white)
                                    .padding(.all)
                                    .padding(.leading)
                                    .opacity(0)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .foregroundColor(.white)
                                    
                                    Text(item.paymentDate)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                                .padding(.all)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .background(Color.red)
                                        .opacity(0.2))
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    
    static private var crap = Contact(id: 11, name: "awe", email: "zaw", phone: "123123", overdueExpenses: 12, overdueExpensesDate: "awe", projectedExpenses: 412, projectedExpensesDate: "azws", payments: [Payments(historyID: 1, contactID: 2, title: "awe", paymentDate: "123", paid: true, amount: 5), Payments(historyID: 1, contactID: 2, title: "awe", paymentDate: "123", paid: true, amount: 5)])
    
    static var previews: some View {
        ContactDetailsView(contact: crap)
    }
}
