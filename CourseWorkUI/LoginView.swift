//
//  LoginView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI
struct LoginView: View {
    @State private var email=""
    @State private var password=""
    @State private var loginStatus = false
    @State var isError = false
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path:$path)
        {
            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                
                
                VStack{
                    Text("Login").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                    
                    ReusableTextView(text: $email, placeholder:"Email")
                    ReusableTextView(text: $password, placeholder:"Password")
                    
                    
                    HStack{
                        Button {
                            exit(0)                        }label:{
                                Text("Quit").padding()
                                    .frame(maxWidth: .infinity).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                    .padding(.vertical,8)
                                .foregroundStyle(Color.black)}
                        Spacer()
                        
                        Button {
                            Task{
                                
                                loginStatus =   await login(email: email, password:password)
                                
                                if loginStatus
                                {
                                    path.append("welcome")
                                    
                                }else{
                                    isError = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        isError = false
                                    }                  }
                                
                            }
                            
                            
                        }label:{
                            Text("login").padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black)}
                    }.padding(.vertical)
                    
                    NavigationLink(value:"register")
                    {
                        Text("Register now!").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )               }
                }
                if (isError){ ErrorPopupView()
                }
            }
            
            .navigationDestination(for:String.self){
                page in
                if page == "login"
                {
                 LoginView()
                }else if page == "register"
                {
                    RegistrationView(path:$path)
                }
                else if page == "welcome"
                {
                    WelcomeView(path:$path)
                }
                else if page == "cart"
                {
                    ShoppingCartView(path:$path)
                }
                else if page == "account"
                {
                    EditAccountView(path:$path)
                }else if page == "newProduct"
                {
                    NewProductView(path:$path)
                }            }
            .navigationDestination(for:RegistrationRequestData.self){ obj in
                RegistrationViewPartTwo(email: obj.email, userName:obj.userName, password: obj.password, password_confirmation: obj.passwordConfirmation,path:$path)
                
            }
            .navigationDestination(for:RegistrationRequestDataTwo.self){ obj in
                EditAccountViewPartTwo(email: obj.email, userName:obj.userName, password: obj.password, password_confirmation: obj.passwordConfirmation,path:$path)
                
            }
            .navigationDestination(for:RegistrationRequestDataTwoV2.self){ obj in
                RegistrationViewPartTwo(email: obj.email, userName:obj.userName, password: obj.password, password_confirmation: obj.passwordConfirmation,path:$path)
                
            }            .navigationDestination(for:UserOrderResponse.self){
                response in
                ViewOrdersView(response:response,path:$path)
            }.navigationDestination(for:AdminOrderResponse.self){
                response in
            ViewOrdersForAdminView(response:response,path:$path)
            }.navigationDestination(for: ClothWholeResponse.self) { response in
                AvailableProductsView(response:response,path:$path)
            }
            .navigationDestination(for: DetailedCloth.self) { response in
                DetailedProductView(response:response.data,img:response.data.data[0].image,path:$path)
            }
            .navigationDestination(for: ClothData.self) { response in
                PlaceOrderView(response:response,path:$path)
            }
            .navigationDestination(for: NewProductData.self) { response in
                NewProductViewTwo(name: response.name, price: response.price, color: response.color, size: response.size, path:$path)
            }            .navigationDestination(for: NewProductDataTwo.self) { response in
                NewProductViewThree(path:$path, name: response.name, price: response.price, color: response.color, size: response.size,
                                    description:response.description)
            }.navigationDestination(for: ClothWholeResponseDescription.self) { response in
                ProductDiscriptionView(path:$path, response:response )
            }            }
        }
        
        
    }
    


#Preview {
    LoginView()
}
