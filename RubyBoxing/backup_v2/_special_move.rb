# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class SpecialMove < Move

  def initialize title, options = {}
    @title = title

    options[:hit_chance] = 75
    options[:hit_damage] ||= nil
    options[:stun_chance] ||= 0
    options[:heal_amount] ||= nil

    points = 100 - 
      (options[:hit_damage] || 0) - 
      (options[:heal_amount] || 0)
    
    validate_options points, options
  end
end