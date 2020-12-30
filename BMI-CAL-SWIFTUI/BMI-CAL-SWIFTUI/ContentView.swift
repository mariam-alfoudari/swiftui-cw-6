//
//  ContentView.swift
//  BMI-CAL-SWIFTUI
//
//  Created by mariam alfoudari on 29/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State var height: String = ""
    @State var weight: String = ""
    @State var bmi: String = "0.00"
    @State var bmiStatus: String = ""
    @State var image = "White"
    @State var text = ""
    @State var textFeildColor = Color.white
    @State var textFeildColorTwo = Color.white
    
    var body: some View {
        VStack(){
          Image("header")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea(.all)
            
          Text("حاسبه الاحباط")
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.center)
            
            
        TextField("Height (m)", text: $height)
            .background(textFeildColor)
        TextField("weight (kg)", text: $weight)
            .background(textFeildColorTwo)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("")
            })
                
            Button("اصدمني") {
                let h = Double(height) ?? 0
                let w = Double(weight) ?? 0
                bmi = String(format: "%.1f", (w / (h * h)))
               status(bmi: Double(bmi)!)
            }
            .padding(3.0)
            Text(bmi)
                .font(.title2)
                .foregroundColor(Color.black)
            VStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(text)
            }
            Spacer()
        }
    
    }
    func status(bmi: Double) {
         if bmi < 20{
            self.image = "thin"
            self.text = "كما الريشة"
     }
         else if bmi >= 20 && bmi <= 25{
            self.image = "normal"
            self.text = " عباله متين"
         
     }
         else if bmi >= 25 && bmi <= 40{
            self.image = "fat"
            self.text = " هذا الي عباله ضعيف"
          
     }else{
        self.text = "اسمح لي بومبا"
        self.image = "superfat"
     }
        if Double(height) ?? 0.0 < 0.0
        {
            self.textFeildColor = Color.red
        }
        else {
            self.textFeildColor = Color.white
        }
        if Double(weight) ?? 0.0 <= 0.0
        {
            self.textFeildColorTwo = Color.red
        }
        else {
            self.textFeildColorTwo = Color.white
        }
     }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

