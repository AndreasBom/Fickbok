//
//  DataFetcher.swift
//  AmbulansensFickbok
//
//  Created by Andreas Bom on 2015-07-23.
//  Copyright © 2015 PTS. All rights reserved.
//

import Foundation

class DataFetcher{
    
    
    private func getAllFileNames(directoryPath: String)->[String]{
        
        //Collect all file names in a directory into an array
        let fileManager = NSFileManager.defaultManager()
        
        
        var contents: [String]?
        
        do{
            try contents = fileManager.contentsOfDirectoryAtPath(NSBundle.mainBundle().resourcePath! + directoryPath)
            
        } catch _ {
            contents = nil
        }
        
        //Remove file extension
        var menuItems: [String] = []
        for content in contents!{
            
            let stringlength = content.characters.count
            let stringLengthIndex = stringlength - 4
            let menuItem = content.substringToIndex(advance(content.startIndex, stringLengthIndex))
            
            menuItems.append(menuItem)
            
        }
        
        return menuItems
        
    }
    
    
    
    func getDrugsForAdults()->[String]{
        return getAllFileNames("/Ambulansens-fickbok/Vuxen")
        //return listOfDrugsForAdults
    }
    
    func getDrugsForChildren()->[String]{
        return getAllFileNames("/Ambulansens-fickbok/Barn")
    }
    
    func getAlgorithms()->[String]{
        return getAllFileNames("/Ambulansens-fickbok/Algoritmer")
    }
    
}