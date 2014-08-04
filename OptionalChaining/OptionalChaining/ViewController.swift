//
//  ViewController.swift
//  OptionalChaining
//
//  Created by ShawnCCHuang on 2014-08-03.
//  Copyright (c) 2014 ShawnCCHuang. All rights reserved.
//

import UIKit
class Person{
    var residence:Residence?
    
}
class Residence{
    var rooms = [Room]()
    
    var numberOfRooms: Int
    {
    return rooms.count
    }
    
    subscript(i: Int) -> Room{
        return rooms[i]
    }
    
    func printNumberOfRooms(){
        println("The number of rooms is \(numberOfRooms).")
        
    }
    
    var address: Address?
}

class Room {
    var name:String
    init(name:String){self.name = name}
}

class Address {
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        
        if buildingName{
            return buildingName
        }
        else if buildingNumber{
            return buildingNumber
        }
        else {
            return nil
        }
    }
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let johnsHouse=Residence()
        johnsHouse.rooms+=Room(name:"Living Room")
        johnsHouse.rooms+=Room(name:"Kutchen")
        
        let john=Person()
        john.residence=johnsHouse
        
        
        if let firstRoomName = john.residence?[0].name  {
            
            println("John's first room name \(firstRoomName) room(s).")
            
        } else{
            
            println("Unable to retrieve the first room name.")
        }
        
        let johnsAddress = Address()
        johnsAddress.buildingName="The Larches"
        johnsAddress.street="Laural Street"
        john.residence!.address=johnsAddress
        
        if let johnsStreet=john.residence?.address?.street{
            
            println("John's street name is \(johnsStreet).")
            
        }else{
            
            println("Unable to retrieve the address.")
        }
        
        
        if let buildingIndentifier = john.residence?.address?.buildingIdentifier(){
            
            println("John's build indentifier is \(buildingIndentifier)")
            
        }
        
        if let upper=john.residence?.address?.buildingIdentifier()?.uppercaseString{
            println("John's uppecase building indentifier is \(upper).")
        }
        
    }
    
    override func didReceiveMemoryWarning(){
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
