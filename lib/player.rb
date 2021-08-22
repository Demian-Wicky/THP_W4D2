class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} est K.O".red 
    else
      puts "#{@name} a #{life_points} points de vie.".green
    end
  end

  def gets_damage(val)
    @life_points -= val
  end

  def compute_damage
    return rand(1..6)
  end

  def attacks(player_to_attack)
    damage_to_do = compute_damage
    puts "#{@name} attaque #{player_to_attack.name}".red
    puts "#{@name} lui inflige #{damage_to_do} points de dégats.".red
    player_to_attack.life_points -= damage_to_do
  end

  def is_dead?
    if @life_points > 0
      return false
    else
      return true
    end
  end

  def is_alive?
    if @life_points > 0
      return true
    else
      return false
    end
  end

end