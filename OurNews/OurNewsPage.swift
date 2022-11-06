//
//  ProductCard.swift
//  day3
//
//  Created by hoton on 06/04/1444 AH.
//
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("appbackground"))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
            .padding(.all, 10)
    }
}


struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(width: 70)
            .padding(.all, 20)
          
    }
}


struct NameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 26, weight: .bold))
            .foregroundColor(Color("textcolor"))
            .padding(.bottom,5)
          
    }
}

struct MessageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color("textcolor2"))
            .padding(.bottom)
          
    }
}

struct DateModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(.black)
            .frame(width:200,alignment: .trailing)

          
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    .frame(maxWidth: .infinity)
    .padding()
    .foregroundColor(.white)
    .background(Color("textcolor"))
    .cornerRadius(8.0)

    }
}






struct card{
    var id = UUID()
    let currentDateTime = Date()
    @State var gender: String
    @State var Name : String
    @State var message : String
}



struct OurNewsPage: View {
    @State private var isPresentedSheet = false
    
    @Binding var AddedMessage :String
    @Binding var AddedName :String
    @Binding var AddedGender :String
    
  
    
    
    
    
    var body: some View {
        
        let cardList:[card] = [
            card(gender: AddedGender, Name: AddedName ,message: AddedMessage),
            card(gender: "FemaleProfile", Name: "Einas" ,message: "Eid fiter celebration"),
            card(gender: "FemaleProfile", Name: "Hoton" ,message: "nice application"),
            card(gender: "MaleProfile", Name: "Ahmed" ,message: "hello dear neighbors :)")
           

    ]
    
        
    
        NavigationView {
        VStack{
                Button{
                    isPresentedSheet = true
                }
            label:{Text("Add post")}
            .modifier(ButtonModifier())
                
            ScrollView(.vertical){
                
                
                ForEach(cardList,id: \.id){ oneCard
                    in
            HStack{
        
                   Image(oneCard.gender)
                           .resizable()
                           .modifier( IconModifier())
            
                       
                   VStack(alignment: .leading) {
                             Text(oneCard.Name)
                                .modifier(NameModifier())
                          
                            
                             Text(oneCard.message)
                                .modifier(MessageModifier())
                         
                             Text(Date.now , format:.dateTime.hour().minute())
                                 .modifier( DateModifier())
                    }
                        Spacer()
           }.modifier(CardModifier())
                    
                    
                }
              
            }
            
        }.padding()
        .navigationTitle("our news")
            
        }.sheet(isPresented: $isPresentedSheet, content: {
            AddToOurNews(isPresentedSheet: $isPresentedSheet)})
                      
        
    }
}






struct OurNewsPage_Previews: PreviewProvider {
  
    static var previews: some View {
        OurNewsPage(AddedMessage: Binding<String>.constant("excavtion on the main street"),
                    AddedName: Binding<String>.constant("Rakan"),AddedGender: Binding<String>.constant("MaleProfile"))
       
    }
}

