require "gosu"

class Game < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = "Lamas morötter"
    @llama = Gosu::Image.new("media/img/llama.png")
    @x = 270
    @y = 180
    @carrot = Gosu::Image.new("media/img/carrot.png")
    @carrot_x = Gosu.random(0, width - @carrot.width)
    @carrot_y = Gosu.random(0, height - @carrot.height)
    @carrot = Gosu::Image.new("media/img/carrot.png")
    @carrot_x = Gosu.random(0, width - @carrot.width)
    @carrot_y = Gosu.random(0, height - @carrot.height)
    @munch = Gosu::Sample.new("media/audio/omnomnom.mp3")
    @score = 0
    @font = Gosu::Font.new(24)
  end
 
 def update
    @x -= 5 if Gosu.button_down?(Gosu::KB_LEFT)
    @x += 5 if Gosu.button_down?(Gosu::KB_RIGHT)
    @y -= 5 if Gosu.button_down?(Gosu::KB_UP)
    @y += 5 if Gosu.button_down?(Gosu::KB_DOWN)
    @x = @x.clamp(0, width - @llama.width)
    @y = @y.clamp(0, height - @llama.height)

    if Gosu.distance(@x, @y, @carrot_x, @carrot_y) < 60
      @munch.play
      @score += 1
      @carrot_x = Gosu.random(0, width - @carrot.width)
      @carrot_y = Gosu.random(0, height - @carrot.height)
    end
  end
  
  def draw
    @llama.draw(@x, @y, 0)
    @carrot.draw(@carrot_x, @carrot_y, 0)
    @font.draw_text("Morötter: #{@score}", 10, 10, 10)
  end
end

Game.new.show
