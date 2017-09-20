//
//  Character.swift
//  FuturamaCharacters
//
//  Created by Steven Vlaminck on 9/12/17.
//  Copyright © 2017 Steven Vlaminck. All rights reserved.
//

import UIKit

struct Character {
    let name: String
    let description: String
    let imageName: String
    func image() -> UIImage? {
        return UIImage(named: imageName)
    }
}

func initialData() -> [Character] {
    return [
        Character(
            name: "Philip J. Fry",
            description: "Protagonist, from the 20th Century. Delivery boy. Many times great-uncle to Professor Hubert Farnsworth. Suitor of Leela.",
            imageName: "Fry"
        ),
        Character(
            name: "Turanga Leela",
            description: "Mutant cyclops. Captain of the Planet Express Ship. Love interest of Fry.",
            imageName: "Leela"
        ),
        Character(
            name: "Bender Bending Rodriguez",
            description: "A kleptomaniacal, lazy, cigar-smoking, heavy-drinking robot who is Fry's best friend. Built in Tijuana, Mexico, he is the Planet Express Ship's cook.",
           imageName: "Bender"
        ),
        Character(
            name: "Amy Wong",
            description: "Chinese-Martian intern at Planet Express. Fonfon Ru of Kif Kroker.",
            imageName: "Amy"
        ),
        Character(
            name: "Hermes Conrad",
            description: "Bureaucrat and accountant of Planet Express.",
            imageName: "Hermes"
        ),
        Character(
            name: "Professor Hubert J. Farnsworth",
            description: "Many times great-nephew of Fry. CEO and owner of Planet Express delivery company. Tenured professor of Mars University.",
            imageName: "Farnsworth"
        ),
        Character(
            name: "Doctor John Zoidberg",
            description: "Alien from Decapod 10. Planet Express' staff doctor and steward. Has a medical degree and Ph.D in art history.",
            imageName: "Zoidberg"
        ),
        Character(
            name: "Lord Nibbler",
            description: "Nibblonian ambassador to Earth. Poses as Leela's pet.",
            imageName: "Nibbler"
        ),
        Character(
            name: "Zapp Brannigan",
            description: "25-star General in the Democratic Order of Planets (D.O.O.P.), Captain of the Nimbus flagship and head of the D.O.O.P. army.",
            imageName: "Zapp"
        ),
        Character(
            name: "Kif Kroker",
            description: "Amphibiosion. Fourth Lieutenant of the Nimbus spaceship. Husband of Amy Wong.",
            imageName: "Kif"
        ),
        Character(
            name: "Mom",
            description: "Antagonist. Owner of MomCorp, and Professor Farnsworth's former lover.",
            imageName: "Mom"
        )
    ]
}
