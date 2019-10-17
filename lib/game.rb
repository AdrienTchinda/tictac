require "pry"

class Game

  #ON INITIALISE LES VARIABLES DE CLASSE
  attr_accessor :board, :player_1, :player_2, :timer

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #ON INITIALISE LE TABLEAU WIN_COMBINATIONS CONTENANT DES TABLEAUX DE COMBINAISONS GAGNANTES
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  #
  def current_player
    board.turn_count.even?  ? player_1 : player_2
  end
 
  def won?
    WIN_COMBINATIONS.find do |combo|
      #([a, b, c] étant une combinaison pour gagner une partie)
      # le "pion" étant X ou O
      # POUR CHAQUE "combo=[a, b, c]" la boucle va vérifier si le pion à a est le même que celui à b :
      # d'où : board.cells[combo[0]] == board.cells[combo[1]]
      # Si cette condition est vérifiée pour un combo, la boucle va vérifier maintenant si le pion à b est le même que celui à c
      # d'où board.cells[combo[1]] == board.cells[combo[2]]
      # Si cette condition est aussi vérifiée pour ce même combo, la boucle va enfin vérifier si a est bel et bien égal à un pion et non à une case vide " "
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end


  #RETOURNE LA VALEUR TRUE SI LE TABLEAU EST PLEIN ET SI LE JOUEUR N A PAS GAGNE
  def draw?
    board.full? && !won?
  end

  #RETOURNE LA VALEUR TRUE SI UN DES DEUX JOUEURS A GAGNE OU SI LE TABLEAU EST PLEIN
  def over?
    won? || draw?
  end
  def winner
    board.cells[won?[0]] if won?
    print board.cells[won?[0]]
  end
  def turn
    #AFFICHER C EST LE TOUR DU 
    puts "It's now #{current_player.token}'s turn."
    input = current_player.move(board).to_i
    if board.valid_move?(input.to_s)
      board.update(input, current_player)
      board.display

      #SINON, SI L'INPUT ENTRE PAR LE JOUEUR N EST PAS COMPRIS ENTRE 1 ET 9, AFFICHER..
    elsif input.between?(1, 9) == false
      puts "Entrer un nombre entre 1 et 9"
    else
      puts "Cette case est déjà prise"
    end
  end
  def play
    #REINITIALISER LE TABLEAU DU JEU
    board.reset
    #AFFICHER LE TABLEAU DU JEU
    board.display
    #JUSQU A CE QUE LE TABLEAU SOIT PLEIN OU QU UN JOUEUR AIT GAGNE, EFFECTUER TURN
    until over?
      turn
    end
    #SI LE TABLEAU EST PLEIN, AFFICHER..
    if draw?
      puts "Il n'y a pas de gagnant"
    #SI UN JOUEUR A REMPLI UNE DES 8 COMBINAISONS, AFFICHER
    elsif won?
      puts "Le gagnant est #{winner}"
    end
  end
end
