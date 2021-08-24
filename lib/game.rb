class Game
  attr_accessor :humanplayer, :enemies

  def initialize(name)
  generate_enemies
  @humanplayer = HumanPlayer.new(name)
  end

  def generate_enemies
    names = ["Arbock", "Smogogo", "Excelangue", "Empiflor", "Qulbutoké", "Miaouss"]
    @enemies = []
    4.times do
      enemy = Player.new(names.shuffle!.pop.to_s + "#" + rand(100..1000).to_s)
      @enemies << enemy
    end
  end

  # def kill_player(player_name)
  #   @enemies.each do |enemy|
  #     if enemy.name == player_name
  #       @enemies.delete(enemy)
  #     end
  #   end
  # end


  def kill_player(idx)
        @enemies.delete_at(idx)
  end

  def kill_all_enemies
    @enemies = []
  end

  def is_still_ongoing?
    if @enemies.length > 0 && @humanplayer.is_alive?
      return true
    else
      return false
    end
  end

  def show_players
    print humanplayer.show_state
    puts "Il reste #{@enemies.length} enemis".red
    # @enemies.each do |enemy|
    #   print enemy.show_state
    # end
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - ".blue + "Chercher une meilleure arme."
    puts "s - ".blue + "Chercher à se soigner."
    puts
    puts "Attaquer un joueur en vue :".red
    choice_nb = 0
    @enemies.each do |enemy|
        print "#{choice_nb} - ".red
        print "#{enemy.show_state}"
        choice_nb += 1
    end
  end

  def menu_choice(string)
    if string == "a"
      humanplayer.search_weapon
    elsif string == "s"
      humanplayer.search_health_pack
    else
      string = string.to_i
      player_to_attack = @enemies[string]
      humanplayer.attacks(player_to_attack)
      if player_to_attack.is_dead?
        kill_player(string)
      end
    end
  end

  def enemies_attack
    @enemies.each do |enemy|
      enemy.attacks(humanplayer)
    end
  end

  def end
    puts "La partie est finie"
    if humanplayer.is_alive?
      puts "BRAVO ! Tu as Gagné !".yellow
    else
      puts "Loser ! Tu as perdu !".blue
    end
  end

end