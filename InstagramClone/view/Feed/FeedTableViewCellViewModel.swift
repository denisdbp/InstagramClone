//
//  FeedTableViewCellViewModel.swift
//  InstagramClone
//
//  Created by Admin on 01/09/22.
//

import Foundation

class FeedTableViewCellViewModel {
    
    var feedModel:FeedModel
    
    init(feedModel:FeedModel) {
        self.feedModel = feedModel
    }
    
    public var getFeedModel:FeedModel {
        return self.feedModel
    }
    
    public var getImage:String {
        return self.feedModel.image
    }
    
    public var getLiked:Bool {
        return self.feedModel.liked
    }
    
    // Funcao que atualiza o estado atual do like feed selecionado
    public func updateLiked(liked:Bool){
        self.feedModel.liked = liked
    }
}
