
//
//  FirstPage.swift
//  day3
//
//  Created by hoton on 01/04/1444 AH.
//

import SwiftUI



struct AddToOurNews: View {
    
    @State var message = " "
    @State var Name = "hoton"
    @State var Gender = "FemaleProfile"
    
    @Binding var isPresentedSheet : Bool
  
    var body: some View {
        
        
        VStack{
            
            TextField("write here", text: $message)
                .frame(height: 300 )
                .background(Color("appbackground"))
                

        Button{
          
    
           // OurNewsPage(AddedMessage: $message)
            OurNewsPage(AddedMessage: $message, AddedName:$Name, AddedGender:$Gender)
            isPresentedSheet = false
            

        }
    label:{
        Text("Add")
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color("textcolor"))
            .cornerRadius(8.0)
    }
 
        
    }.padding()
        
    }
    }

struct AddToOurNewsPreviews: PreviewProvider {
    static var previews: some View {
        AddToOurNews(isPresentedSheet: Binding<Bool>.constant(false))
    }
}
