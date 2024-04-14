import SwiftUI
import PhotosUI

struct NewProductViewThree: View {
    @State  var selectedItems = [PhotosPickerItem]()
    @State  var selectedImages = [Image]()
    @State var imageDatas:[UIImage] = []
    @Binding var path: NavigationPath
    
    var name: String
    var price: String
   var color: String
   var size: String
   var description: String
    
    var body: some View {
        ZStack {
            Color(red: 217/255, green: 217/255, blue: 217/255).ignoresSafeArea()
            
            VStack {
                Text("New product").font(.system(size: 36)).foregroundStyle(Color(red: 127/255, green: 123/255, blue: 13/255))
                
                    ScrollView {
                        LazyVStack {
                            ForEach(0..<selectedImages.count, id: \.self) { i in
                                selectedImages[i]
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                            }
                        }
                    }
                    .toolbar {
                        PhotosPicker("Select images", selection: $selectedItems, matching: .images)
                    }
                    .onChange(of: selectedItems) { old,new in
                        Task {
                            selectedImages.removeAll()
                            for item in new {
                                if let image = try? await item.loadTransferable(type: Image.self) {
                                     selectedImages.append(image)
                                    
                                }
                            }
                        }
                    }
                }
                
                HStack {
                    Button(action: {
                        // Perform action when "Back" button is tapped
                        path.removeLast()
                    }) {
                        Text("Back")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 195/255, green: 184/255, blue: 83/255))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .foregroundColor(Color.black)
                            .padding(.vertical, 30)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                         
                                            // Convert Image to UIImage
                            let images: [Image] = selectedImages
                            imageDatas  = imagesToData(images: images)
                                           
                                                                                      
                        
                        Task{
                            print(name)
                            await newProduct(product: NewProductDataFinal(id: UUID(), name: name, price: price, color:color, size: size, description: description, images:imageDatas))
                        }

                        // Perform action when "Add" button is tapped
                        // You can add the logic to add the product here
                    }) {
                        Text("Add")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 195/255, green: 184/255, blue: 83/255))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 24)
                            .foregroundColor(Color.black)
                            .padding(.vertical, 30)
                    }
                }
                .padding()
                .padding(.vertical, 24)
                .padding(.horizontal, 24)
            }
        }
    }

