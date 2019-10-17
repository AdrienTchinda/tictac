class Board
  attr_accessor :cells
  def initialize
    reset
  end

  #REINITIALISE LE ARRAY DU JEU A DES STRING VIDES
  def reset
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #AFFICHE LE TABLEAU DU JEU DONT LA CASE INPUT - 1 PREND LA VALEUR X, O, ou " "
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  #PERMET DE POSITIONNER LE PION DANS LA CELLULE INPUT - 1
  def position(input)
    input = input.to_i
    cells[input - 1]
  end
  def full?
    cells.none? {|cell| cell == " " || cell == nil}
  end

  #IL COMPTE LE NOMBRE DE X OU BIEN LE NOMBRE DE O QU IL Y A DANS L ARRAY CELLS
  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  #RETOURNE TRUE SI LA VALEUR ENTRE EST DEJA PRISE A LA CASE INPUT - 1
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  #RETOURNE TRUE SI LA VALEUR ENTRE CORRESPOND A UNE CASE INPUT - 1 DEJA PRISE ET SI ELLE EST COMPRISE ENTRE 1 ET 9
  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end


  def update(input, player)
    input = input.to_i
    cells[input -1] = player.token
  end
end