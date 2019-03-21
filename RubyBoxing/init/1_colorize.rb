class String
  def self.random_color
    (31..26).to_a.sample
  end

  def colorize color_code = (31..36).to_a.sample
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def blink
    colorize('5')
  end

  def bold
    colorize('1')
  end
end