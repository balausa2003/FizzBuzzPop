//
//  WelcomePageSwiftUIView.swift
//  FizzBuzzPop
//
//  Created by Балауса Косжанова on 17.04.2023.
//

import SwiftUI

struct WelcomePageSwiftUIView: View {
    @State var showLoadingPage = false
    var body: some View {
        NavigationView {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .ignoresSafeArea()
            VStack {
                Text("ARE YOU READY?")
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width:250)
                    .padding(.trailing,120)
                    .padding(.top,132)
                
                Spacer()
               
                Button (action: {showLoadingPage = true})
                {
                        ZStack {
                            RoundedRectangle(cornerRadius: 100)
                                .frame(width:358,height: 50)
                                .foregroundColor(Color(red: 255/255, green: 221/255, blue: 95/255))
                           
                                Text("Let’s start")
                                    .foregroundColor(.black)
                            
                        }
                        
                    }
                NavigationLink("", destination:  LoadingPageSwiftUIView(), isActive: $showLoadingPage)
                }
                   
                }
            }
        }
    }


struct WelcomePageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageSwiftUIView()
    }
}
