//
//  LoadingPageSwiftUIView.swift
//  FizzBuzzPop
//
//  Created by Балауса Косжанова on 17.04.2023.
//

import SwiftUI


enum FizzBuzzPop: String {
    case FizzBuzz = "Fizz Buzz"
    case BuzzPop = "Buzz Pop"
    case FizzPop = "Fizz Pop"
    case FizzBuzzPop = "Fizz Buzz Pop"
}
struct LoadingPageSwiftUIView: View {
    @State var isClicked = false
    var body: some View {
        NavigationStack {
            LoadingPage()
                .toolbar {
                    NavigationLink(destination:SettingsPage(), isActive: $isClicked) {
                        Button {
                            isClicked = true
                        } label: {
                            Text("Settings")
                                .foregroundColor(.yellow)
                        }
                    }
                

                    
        }
            
    }
        .navigationBarBackButtonHidden(true)
}
struct LoadingPage: View {
    @State var hours = 0
    @State var minutes = 0
    @State var seconds = 0
    @State var timer: Timer? = nil
    @State var remain = 3
    @State var showSecondView = false
    @State var isSelected = false
    @State var buttons = [25,12,5,5,9,18,25,21]
    @State var correctAnswer = [25,25,5,5]
    @State var correct = 4
    @State var timerIsPaused: Bool = true
    let arrayGame:[FizzBuzzPop] = [.FizzBuzzPop,.BuzzPop,.FizzBuzz,.FizzPop]
    let timerRemaining = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .ignoresSafeArea()
            VStack {
             
                Text( correct != 0 ? "\(hours >= 10 ? "\(hours)" : "0\(hours)"):\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds >= 10 ? "\(seconds)" : "0\(seconds)")" : "")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    
                    .padding(.top,40)
                    .onAppear {
                        if correct != 0 || timerIsPaused {
                            self.startTimer()
                        } else {
                            self.stopTimer()
                        }
                    }
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 358, height: 200)
                        .foregroundColor(Color(red: 0.125, green: 0.125, blue: 0.125))
                    Text("\(remain)...")
                        .font(.system(size: 54))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .opacity(showSecondView ? 0 : 1)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                showSecondView = true
                            }
                        }
                    
                        .onReceive(timerRemaining) { _ in
                            if remain > 1 {
                                remain -= 1
                            }
                            
                            
                        }
                    if correct == 0  {
                      
                        VStack {
                            Text("Well Played!")
                                .font(.system(size: 54))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                            Text("\(hours >= 10 ? "\(hours)" : "0\(hours)"):\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds >= 10 ? "\(seconds)" : "0\(seconds)")")
                                
                        }
                        .navigationTitle("Round 1")
                        
                    }
                    
                    
                    if showSecondView  && correct != 0 {
                        
                        VStack {
                            
                            Text("Fizz Buzz")
                                .font(.system(size: 54))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .offset(y:60)
                            
                            
                            Text( correct != 0 ? "Select \(correct) numbers" : "Correct! Proceed to the next round")
                                .foregroundColor(.white)
                                .opacity(0.5)
                                .offset(y:160)
                            
                       
                               
                            
                        VStack {
                         
                                HStack {
                                    Buttons(correct: $correct, correctAnswer: $correctAnswer, numbers: buttons[0])
                                    Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[1])
                                    Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[2])
                                    Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[3])
                                }
                            
                            HStack {
                                
                                Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[4])
                                Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[5])
                                Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[6])
                                Buttons(correct: $correct,correctAnswer: $correctAnswer,numbers: buttons[7])
                                    
                                
                            }
                            }
                        
                        .offset(y:280)
                        
                            
                            
                        }
                        .navigationBarTitle("Round 1")
                        .navigationBarTitleDisplayMode(.inline)
                        .foregroundColor(.white)
                        
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
                        .padding(.bottom,12)
                    Text("Prepare now")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .opacity(showSecondView ? 0 : 1)
                    
                    Spacer()
                   
                    
                    HStack() {
                        Button {
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color(.white).opacity(0.1))
                                    .frame(width: 40,height: 40)
                                Image(systemName: "gobackward")
                                    .foregroundColor(.white)
                                
                            }
                            }
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(correct != 0 ? Color(red: 0.771, green: 0.728, blue: 0.568) : Color(red: 1, green: 0.867, blue: 0.373))
                                    .frame(width: 196,height: 50)
                                Text(getText())
                                    .foregroundColor(.black)
                                
                            }
                            .padding([.leading,.trailing],20)
                        }
                        
                        StarButton()
                      
                    }
                    
                }
            }
            
        }
    func getText() -> String {
        if showSecondView {
            if correct != 0 {
                return "\(correct) more left"
            } else {
                return "Next round"
            }
        }
        return "Number is loading..."
    }
    
    func startTimer(){
        timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }
    func stopTimer(){
      timerIsPaused = true
      timer?.invalidate()
      timer = nil
    }
    }
}
struct Buttons: View {
    @Binding var correct: Int
    @Binding var correctAnswer: [Int]
    @State var isSelected = false
    var numbers: Int
    var body: some View {
        
        Button {
            isSelected = true
        } label: {
         
                Text("\(numbers)")
                    .foregroundColor(isSelected ? .black : .white)
                    .frame(width: 82,height: 48)
                    
            
            
        }
        .background(
            Group {
                if isSelected {
                    if isCorrect(num: numbers) {
                        Color(red: 0.925, green: 0.894, blue: 0.779)
                    } else {
                        Color(red: 0.843, green: 0, blue: 0.082)
                    }
                } else {
                    Color(red: 0.125, green: 0.125, blue: 0.125)
                }
            }
        )
        .cornerRadius(12)
       
        
    }
    func isCorrect(num: Int) -> Bool {
        
        if correctAnswer.contains(num) {
           correct -= 1
            return true
        }
        return false
    }
}
struct StarButton: View {
    @State var isSelected = false
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            ZStack {
                Circle()
                    .fill(Color(.white).opacity(0.1))
                    .frame(width: 40,height: 40)
                Image( systemName: isSelected ? "star.fill" : "star")
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct LoadingPageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPageSwiftUIView()
    }
}
