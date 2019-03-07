# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Boxer
  attr_accessor :name, :opening_line, :hp, :is_stunned, :moves

  def initialize
    @name ||= "Boxer"
    @opening_line ||= "Hi, I am a boxer"
    @hp ||= 25
    @moves ||= []
    @moves << Move.new('boring punch')
  end

  def fight other_boxer
    if @is_stunned
      @is_stunned = false
      puts "[[#{@name}]] is recovering from being stunned."
      return
    end

    move = @moves.sample
    puts "[[#{@name}]] trying to hit [[#{other_boxer.name}]] with a [[#{move.title}]]"
    is_a_hit = rand(1..100) < move.hit_chance
    if is_a_hit
      move_damage = move.hit_damage.to_f / 10
      other_boxer.hp -= move_damage
      puts "   HIT for [[#{move_damage}]]!  [[#{other_boxer.name}]] has [[#{other_boxer.hp}]] left."

      is_a_stun = rand(1..100) < move.stun_chance
      if is_a_stun
        other_boxer.is_stunned = true
        puts "   AND [[#{other_boxer.name}]] IS STUNNED!!!"
      end
    else
      puts "   It's a miss."
    end
  end
end