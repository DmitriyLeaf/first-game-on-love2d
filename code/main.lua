require "player"
require "location"
require "menu"
require "debugInfo"

function love.load()
	--love.window.setFullscreen(true, desktop)
	menu.button.spawn("Start", 5, 5)
	location.massWall()
	mainMusic = love.audio.newSource("Audio/main.wav")
end

function love.update(dt)
	love.audio.play(mainMusic)
	player.drawUpdate(dt)
	player.mov(dt)
	player.scope()
end

function love.keyreleased(key)
	if key == "escape" then 
		love.event.quit()
	end
end

function love.draw(dt)
	--love.graphics.draw(mainFont)
	location.draw()
	player.draw()
	location.drawWall()
	
	menu.draw()
	
	debugInfo.drawInfo(dt)
	
	--love.graphics.print("f:", 10, love.graphics.getHeight() - 12) 
	--love.graphics.print(player.pointerKick, 20, love.graphics.getHeight() - 12)
end