# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

module EFFECT_TYPES
  DAMAGE = :damage
  HEAL = :heal

  STUN = :stun
  HASTE = :haste
  
  SLOW = :slow
  #FOCUS = :focus

  STENGTHEN = :strengthen
  POISON = :poison
end

class Move
  attr_accessor :title, :effect, :hit_chance, :effect_amount

  def initialize title, effect = EFFECT_TYPES::DAMAGE, hit_chance = 50
    @title = title
    @effect = effect
    @hit_chance = hit_chance > 100 ? 90 : hit_chance
    caculate_effect_amount
  end

  def caculate_effect_amount
    @effect_amount = 0

    case @effect
      when EFFECT_TYPES::DAMAGE
        raise "+hit_chance+ must be less than 100 for EFFECT_TYPES::DAMAGE" unless @hit_chance < 100
        @effect_amount = 100 - @hit_chance
      when EFFECT_TYPES::HEAL
        raise "+hit_chance+ must be less than 100 for EFFECT_TYPES::HEAL" unless @hit_chance < 100
        @effect_amount = (100 - @hit_chance).to_f / 2
      when EFFECT_TYPES::STUN
        raise "+hit_chance+ must be equal to or less than 90 for EFFECT_TYPES::STUN" unless @hit_chance <= 90
        @effect_amount = (100 - @hit_chance) / 10
        @hit_chance = 100 - effect_amount
      when EFFECT_TYPES::HASTE
        raise "+hit_chance+ must be equal to or less than 90 for EFFECT_TYPES::HASTE" unless @hit_chance <= 90
        @effect_amount = (100 - @hit_chance) / 10
        @hit_chance = 100 - effect_amount
      when EFFECT_TYPES::SLOW
        raise "+hit_chance+ must be equal to or less than 90 for EFFECT_TYPES::SLOW" unless @hit_chance <= 90
        @effect_amount = (100 - @hit_chance) / 10
        @hit_chance = 100 - effect_amount
      when EFFECT_TYPES::STENGTHEN
        raise "+hit_chance+ must be equal to or less than 90 for EFFECT_TYPES::STENGTHEN" unless @hit_chance <= 90
        @effect_amount = (100 - @hit_chance) / 10
        @hit_chance = 100 - effect_amount
      when EFFECT_TYPES::POISON
        raise "+hit_chance+ must be equal to or less than 90 for EFFECT_TYPES::POISON" unless @hit_chance <= 90
        @effect_amount = (100 - @hit_chance) / 10
        @hit_chance = 100 - effect_amount
      else
        #raise "Unsupported effect of #{@effect}"
    end
  end

  def handle_move fighter, opponent
    modified_hit_chance = (fighter.slow_timer > 0) ? (@hit_chance / 2) : @hit_chance
    is_a_hit = (1..Modifiers::HIT_CHANCE_MODIFIER).to_a.collect { rand(1..100) }.min < modified_hit_chance
    if is_a_hit
      modified_effect_amount = @effect_amount
      modified_effect_amount *= 2 if fighter.strengthen_timer > 0
      modified_effect_amount *= 0.5 if fighter.poison_timer > 0
      
      case @effect
        when EFFECT_TYPES::DAMAGE
          damage = @effect_amount * Modifiers::DAMAGE_MODIFIER
          opponent.hp -= damage
          puts "   #{damage.to_s.colorize fighter.color} damage to #{opponent.name_s}!" if Match.output?
        when EFFECT_TYPES::HEAL
          heal_amount = @effect_amount * Modifiers::HEAL_MODIFIER
          fighter.hp += heal_amount
          fighter.hp = fighter.starting_hp if fighter.hp > fighter.starting_hp
          puts "   #{heal_amount.to_s.colorize fighter.color} #{'healed'.colorize fighter.color}!" if Match.output?
        when EFFECT_TYPES::STUN
          stun_timer = @effect_amount #* Modifiers::STUN_MODIFIER
          opponent.stun_timer = stun_timer
          puts "   #{opponent.name_s} STUNNED for #{stun_timer.to_s.colorize fighter.color} rounds!!!" if Match.output?
        when EFFECT_TYPES::HASTE
          haste_timer = 1 + @effect_amount #* Modifiers::HASTE_MODIFIER
          fighter.haste_timer = haste_timer
          puts "   #{'HASTED'.colorize fighter.color} for #{haste_timer} rounds!!!" if Match.output?
        when EFFECT_TYPES::SLOW
          slow_timer = @effect_amount #* Modifiers::HASTE_MODIFIER
          opponent.slow_timer = slow_timer
          puts "   #{opponent.name_s} SLOWED for #{slow_timer.to_s.colorize fighter.color} rounds!!!" if Match.output?
        when EFFECT_TYPES::STENGTHEN
          strengthen_timer = 1 + @effect_amount #* Modifiers::STENGTHEN_MODIFIER
          fighter.strengthen_timer = strengthen_timer
          puts "   #{'STRENGTHEND'.colorize fighter.color} for #{strengthen_timer} rounds!!!" if Match.output?
        when EFFECT_TYPES::POISON
          poison_timer = 1 + @effect_amount #* Modifiers::POISON_MODIFIER
          opponent.poison_timer = poison_timer
          puts "   #{opponent.name_s} POISONED for #{poison_timer.to_s.colorize fighter.color} rounds!!!" if Match.output?
        else
          #raise "Unsupported effect of #{@effect}"
      end
    end
  end
end