//
//  Characters model.swift
//  RICKandMORTY_MVVM
//
//  Created by Артем Вологдин on 08.02.24.
//

import Foundation

struct Hero: Decodable{
    var results:[ResultsData] = []
    var info = PageInfo()
}

struct ResultsData: Decodable{
    var id: Int = 0
    var name:String = " "
    var status:String = " "
    var species:String = " "
    var type:String = " "
    var gender:String = " "
    var image:String = " "
    var url:String = " "
    var created:String = " "
    var origin = Origin()
    var location = Location()
    var episode: [String] = []
}

struct Origin :Decodable{
    var name:String = " "
    var url:String = " "
}

struct Location: Decodable{
    var name:String = " "
    var url:String = " "
}



struct PageInfo:Decodable{
    var count :Int = 0
    var pages :Int = 0
    var next :String?
    var prev :String?
}

    


struct Episode: Decodable{
    var id: Int = 0
    var name: String = " "
    var air_date: String = " "
    var episode: String = " "
    var characters: [String] = []
    var url: String = " "
    var created: String = " "
}
