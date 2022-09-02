//
//  controller.swift
//  InstagramClone
//
//  Created by Admin on 14/08/22.
//

import Foundation
import FirebaseAuth

class FeedViewModel {
    
    //Inicializa a autenticacao do Firebase
    private let auth:Auth = Auth.auth()
    
    public let statusModel:[StatusModel] = [
        StatusModel(image: "imagem"),
        StatusModel(image: "instagram"),
        StatusModel(image: "imagem"),
        StatusModel(image: "instagram"),
        StatusModel(image: "imagem"),
        StatusModel(image: "instagram"),
        StatusModel(image: "imagem"),
        StatusModel(image: "instagram")
    ]
    
    public var feedModel:[FeedModel] = [
        FeedModel(id: 0, image: "imagem", description: "", commentes: "", liked: false),
        FeedModel(id: 1, image: "instagram", description: "", commentes: "", liked: false),
        FeedModel(id: 2, image: "imagem", description: "", commentes: "", liked: false),
        FeedModel(id: 3, image: "instagram", description: "", commentes: "", liked: false),
        FeedModel(id: 4, image: "imagem", description: "", commentes: "", liked: false)
    ]
    
    // Funcao para criar um usuario
    public func createUser(email:String, password:String, completion:@escaping(_ result:AuthDataResult?, _ error: Error?)->()){
        self.auth.createUser(withEmail: email, password: password) { (result, error) in
            completion(result, error)
        }
    }
    
    // Funcao para fazer login de um usuario
    public func loginUser(email:String, password:String, completion:@escaping(_ result:AuthDataResult?, _ error: Error?)->()){
        self.auth.signIn(withEmail: email, password: password) { (result, error) in
            completion(result, error)
        }
    }
    
    // Funcao para retornar para a StatusViewController a imagem clicada na CollectionView de Status
    public func getImageStatus(indexPath:Int)->String{
        return self.statusModel[indexPath].image
    }
    
    // Funcao que retorna os index para as celulas da TableView
    public func getIndexPath(indexPath:IndexPath)->FeedModel{
        return self.feedModel[indexPath.row]
    }
    
    // Funcao que atualiza o estado atual do botao de Like da Feed selecionada
    public func updateLiked(_ feedModel:FeedModel){
        if let i = self.feedModel.firstIndex(where: {feedModel.id == $0.id}) {
            self.feedModel[i] = feedModel
        }
    }
}
