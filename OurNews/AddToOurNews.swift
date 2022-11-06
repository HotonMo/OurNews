
//
//  FirstPage.swift
//  day3
//
//  Created by hoton on 01/04/1444 AH.
//

import SwiftUI



struct AddToOurNews: View {
    
    @State var message :String = "hello"
    @State var Name :String = "hoton"
    @State var Gender :String = "FemaleProfile"
    
  //  @State private var showsheet = false
    @Binding var isPresentedSheet : Bool
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                TextField("write here", text: $message)
                    .frame(height: 300 )
                    .background(Color("appbackground"))
                
                //
                //                NavigationLink{
                //
                //
                //                    // OurNewsPage(AddedMessage: $message)
                //                    OurNewsPage(AddedMessage: $message, AddedName:$Name, AddedGender:$Gender)
                //                    //  isPresentedSheet = false
                //
                //
                //                }label:{
                //                    Text("Add")
                //                    .frame(maxWidth: .infinity)
                //                               .padding()
                //                    .foregroundColor(.white)
                //                    .background(Color("textcolor"))
                //                    .cornerRadius(8.0)
                //                }
                
                
                
                Button("next") {
        
                   
                    isPresentedSheet = false
                    OurNewsPage(AddedMessage: $message, AddedName:$Name, AddedGender:$Gender)
                    
                    
                }
                    // Text()
                    .modifier(ButtonModifier())
 
                
                    
               
                }
            .padding()
//                        .sheet(isPresented: $isPresentedSheet){
//                            OurNewsPage(AddedMessage: $message, AddedName:$Name, AddedGender:$Gender)
//                            //                        .fullScreenCover(isPresented: $isPresentedSheet, content: {
                            //                            OurNewsPage(AddedMessage: $message, AddedName:$Name, AddedGender:$Gender)})
                            
                        
                }}
        }
    
//}
    

struct AddToOurNewsPreviews: PreviewProvider {
    static var previews: some View {
        AddToOurNews(isPresentedSheet: Binding<Bool>.constant(false))
    }
}
