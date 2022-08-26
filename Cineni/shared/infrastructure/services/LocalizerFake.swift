//
//  LocalizerFake.swift
//  Cineni
//
//  Created by Daniel Ramos on 26/8/22.
//
import Swinject

class LocalizerFake: Localizer {
    public static func build(_: Resolver) -> LocalizerFake {
        return LocalizerFake()
    }
    
    func translate(_ key: LocalKeys) -> String {        
        return LocalizerNative.toLocalKey(key)
    }
}

