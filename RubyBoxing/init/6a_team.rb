# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Team
  attr_accessor :fighters, :members
  
  def initialize *fighters
    @fighters = fighters
    generate_members
  end

  def generate_members
    @members = @fighters.collect do |fighter|
        fighter.new
    end
  end

  def scrum_members
    @members.delete_if {|member| member.hp < 1 }
  end

  def to_s
    fighters
  end
end