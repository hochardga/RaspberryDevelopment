# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Move
  attr_accessor :title, :hit_chance, :hit_damage, :stun_chance, 
  :heal_amount

  def initialize title, options = {}
    @title = title

    options[:hit_chance] ||= nil
    options[:hit_damage] ||= nil
    options[:stun_chance] ||= 0
    options[:heal_amount] ||= 0

    points = 100 - 
      (options[:hit_chance] || 0) - 
      (options[:hit_damage] || 0) - 
      (options[:stun_chance] || 0) - 
      (options[:heal_amount] || 0)
    
    validate_options points, options
  end

  def validate_options points, options
    raise "Illegal move.  You only get 100 points.  For move '#{@title}' you passed in #{options}." if points > 100

    empty_options = []
    options.each do |option, option_value|
      empty_options << option if option_value.nil?
    end

    empty_options.each do |empty_option|
      options[empty_option] = points / empty_options.count
    end
    
    options.each do |key, value|
      send "#{key}=", value
    end
  end
end