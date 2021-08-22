class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} est K.O".red 
    else
      puts "#{@name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level}".yellow
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    if dice <= @weapon_level
      puts "Tu trouves une arme de niveau #{dice} ! ".yellow + "🤬 Elle n'est pas mieux que ton arme actuelle...".red
    elsif dice > @weapon_level
      puts "Tu trouves une arme de niveau #{dice} ! ".yellow + "Youhou 😃! elle est meilleure que ton arme actuelle : tu la prends.".green
      @weapon_level = dice
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "Tu n'as rien trouvé...".yellow
    elsif
      dice >= 2 && dice <=5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !".green
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
    else
      puts "Waow, tu as trouvé un pack de +80 points de vie !".green
      @life_points +=80
      if @life_points > 100
        @life_points = 100
      end
    end
  end

end