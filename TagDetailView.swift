import SwiftUI

struct TagDetailView: View {
    @State private var tagName: String = "Tag #1"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage? = nil

    @State private var toggle1 = false
    @State private var toggle2 = false
    @State private var toggle3 = false
    @State private var toggle4 = false

    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Button {
                   
                } label: {
                    Image(systemName: "arrow.uturn.left")
                        .font(.title2)
                }

                Spacer()
            }
            .padding(.horizontal)

            
            Text("Tag Details")
                .font(.largeTitle)
                .fontWeight(.bold)

           
            HStack {
                Text(tagName)
                    .font(.title2)
                    .fontWeight(.semibold)

                Button {
                
                } label: {
                    Image(systemName: "pencil")
                }
            }

            
            Button {
                showImagePicker = true
            } label: {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    VStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "plus")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            )
                        Text("Add Image")
                    }
                }
            }

       
            Group {
                Toggle("Lorem", isOn: $toggle1)
                Toggle("Ipsum", isOn: $toggle2)
                Toggle("Lorem Ipsum", isOn: $toggle3)
                Toggle("Ipsum lorem", isOn: $toggle4)
            }
            .padding(.horizontal)
            .toggleStyle(SwitchToggleStyle(tint: .black))

            Spacer()

     
            Button {
              
            } label: {
                Text("Add Stickit")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
            .padding(.horizontal)

        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
        .padding()
    }
}
