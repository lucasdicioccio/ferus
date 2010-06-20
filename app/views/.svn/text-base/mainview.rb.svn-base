#mainview.rb

class MainScreen < Ferus::Screen

	background("mainscreen.png")

	def view
		@shoots.each do |s|
			s.put
		end
		@units.each do |u|
			u.images[0].put_at(u.x,u.y)
		end
		@boss.put
		@bidule.put
		@explosions.each do |e|
			@explosions -= [e] if e.removed?
			e.put
		end
		#puts @explosions.length if $DEBUG
	end

end
