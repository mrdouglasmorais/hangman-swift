//
//  RulesData.swift
//  Hangman Game
//
//  Created by Ben Clarke on 25/04/2020.
//  Copyright © 2020 Ben Clarke. All rights reserved.
//

import Foundation

struct rulesData {
    
    static let gamesRulesTitle = [
        "1. O Objetivo",
        "2. Adivinhe a letra",
        "3. Vidas",
        "4. Pontos",
        "5. Dicas",
        "6. Ganhador"
    ]
    
    static let gamesRules = [
        "Adivinhe a palavra antes que o carrasco seja enforcado e consiga o máximo de pontos possível.",
        "Quando você acertar uma letra, verá onde ela vai na palavra.",
        "Quando você acertar uma letra, verá onde ela vai na palavra.",
        "Você ganha um ponto para suposições corretas e perde um ponto para suposições incorretas.",
        "Você consegue uma pista por palavra, mas sacrifica um ponto e uma vida por cada pista.",
        "Se acertar a palavra, você pode continuar brincando com uma nova palavra."
    ]
}
