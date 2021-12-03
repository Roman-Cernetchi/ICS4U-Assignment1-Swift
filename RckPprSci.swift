//
//  RockPaperScissors.swift
//
//  Created by Roman Cernetchi
//  Created on 2021-12-03
//  Version 1.0
//  Copyright (c) 2021 Roman Cernetchi. All rights reserved.
//
//  This program makes the user play rock paper scissors with the computer.
//
import Foundation

// This function generates a random rock, paper or scissors choice as the
// bot's choice
func compPlay() -> String {

    let lowerNum = 0
    let higherNum = 2
    let randomInt = Int.random(in: lowerNum...higherNum)

    var compPlayValue = ""

    switch randomInt {
    case 0:
      compPlayValue = "rock"
    case 1:
      compPlayValue = "paper"
    case 2:
      compPlayValue = "scissors"
    default:
      break
    }

    return compPlayValue
}

// This function returns who won
func whoWins(userChoice: String, compPlay: String) -> String {

    let whoWinsValue: String

    if userChoice == compPlay {
        whoWinsValue = "Tie. "
    } else if (userChoice == "rock" && compPlay == "scissors")
              || (userChoice == "scissors" && compPlay == "paper")
              || (userChoice == "paper" && compPlay == "rock") {

        whoWinsValue = "You won! "
    } else {
        whoWinsValue = "You lost, try again! "
    }

    return whoWinsValue
}

// Takes in user input, makes sure it is rock paper or scissors, finds the
// random bot choice and who wins. Then display it to the user.
// User prompt
print("Please enter a move.(Rock, Paper, or Scissor): ", terminator: "")

// Gathers the user input and makes sure it isn't empty
guard let userChoice = readLine(), !userChoice.isEmpty else {
    print("Please enter a correct input.")
    print("\nDone.")
    exit(001)
}

// Validates that the user entered rock, paper or scissors
switch userChoice {
case "rock", "paper", "scissors":
    break
default:
    print("Please enter a correct input.")
    print("\nDone.")
    exit(001)
}

// Gets bot choice and who won
let compPlayValue = compPlay()
let whoWinsValue = whoWins(userChoice: userChoice, compPlay: compPlayValue)

// Display it to the user
print("\(whoWinsValue)The computer played \(compPlayValue).")

print("\nDone.")
