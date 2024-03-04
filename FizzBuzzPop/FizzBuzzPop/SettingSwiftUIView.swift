//
//  SettingSwiftUIView.swift
//  FizzBuzzPop
//
//  Created by Балауса Косжанова on 01.05.2023.
//

import SwiftUI

struct SettingSwiftUIView: View {
    var body: some View {
        NavigationStack {
            SettingsPage()
                .toolbar {
                    Button {
                        
                    } label: {
                        Text("Save")
                            .foregroundColor(.white.opacity(0.5))
                    }
        }
        }
            .navigationTitle("Settings")
        
            

    }
}
struct SettingsPage: View {
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .ignoresSafeArea()
            VStack {
                
                Lines(text: "Rounds", cons:"3")
                Divider()
                Lines(text: "Numbers to select", cons:"8")
                Divider()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("Settings")
                                    .foregroundColor(Color.white)
                                    .accessibilityAddTraits(.isHeader)
                            }
                        }
                        
                    }
                HStack {
                    Text("Configure")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top,50)
                        .padding(.horizontal)
                    Spacer()
                }
                VStack {
                    Button {
                        
                    } label: {
                        Lines(text:"Fizz", cons: "3")
                    }
                    Button {
                        
                    } label: {
                        Lines(text:"Buzz", cons: "5")
                    }
                    Button {
                        
                    } label: {
                        Lines(text:"Pop", cons: "7")
                    }
                      
                       

                    
                    
                }
                Spacer()
                
            }
            .foregroundColor(.white)
        }
    }
}
struct Lines: View {
    var text: String
    var cons: String
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .padding()
                
                
                Spacer()
                TextField("Time",
                          text:.constant(cons))
                .frame(width: 90, height: 22)
                .multilineTextAlignment(.trailing)
                .padding(.trailing)
                .keyboardType(.numberPad)
                
                
            }
            Divider()
                .overlay(.white.opacity(0.4))
                .frame(width: 350)
        }
    
    }
}
struct SettingSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingSwiftUIView()
    }
}
