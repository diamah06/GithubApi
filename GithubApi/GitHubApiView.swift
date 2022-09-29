//
//  GitHubApiView.swift
//  GithubApi
//
//  Created by Mahdia Amriou on 27/09/2022.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var username: String = ""
    @State private var user = Gitb(login: "", avatarUrl: "", name: "")
   
    
    
    var body: some View {
        VStack{
     
            Image("logo")
            
            TextField("Entrer login", text: $username)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(20))
                .font(.headline)
            
            
            Button {
                Task{
                 user = try await getRandomGuitb(pseudo: username)
                    
                }
                            } label: {
                                Text("Press")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                     .padding()
                                .background(Color.gray.cornerRadius(20))
                            }
            
           

           if !username.isEmpty {
                VStack{
                    Text(user.name)
                        .font(.title)
                    Text(user.login)
                        .font(.title)
                //Text(user.avatarUrl)
      // pour afficher une image url
                    AsyncImage(url: URL(string: user.avatarUrl)) {
                        image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                                       } placeholder: {}
                .frame(width: 250, height: 250)
                    }
                    
                    
                }
            }
        }
        
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
