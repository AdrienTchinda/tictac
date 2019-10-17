#!/usr/bin/env ruby

require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'game'
require_relative 'board'
require_relative 'players/human'

puts "Welcome to Tic Tac Toe!"

def start
  Game.new.play
  puts "Partie terminée ! Voulez-vous rejouer ?"
  boucle
end

def boucle
  puts "Appuyez sur o ou n"
  reponse = gets.chomp
    if reponse == "o"
      start
    elsif reponse == "n"
      puts "A bientôt!"
    end
end
start
