debugInfo = {}
	
	debugInfo.drawInfo = function(dt)
		love.graphics.print("x: "..tostring(player.x), 5, love.graphics.getHeight() - 44) 
		
		love.graphics.print("y: "..tostring(player.y), 5, love.graphics.getHeight() - 34)
		
		love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 5, love.graphics.getHeight() - 22)
		
		love.graphics.print("dt: "..tostring(dtPoint), 5, love.graphics.getHeight() - 12) 
	end