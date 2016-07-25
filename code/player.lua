fullImage = love.graphics.newImage("Sprites/SpriteSheet.png")
size = 32
dtPoint = 0

player = {}
	player.leftRightPointer = 0 -- 0 if right,  1 if left
	player.x, player.y, player.speed = 32, 32, 32
	
	player.currentImage = 1
	player.image = {}
		for i = 0, 5 do 
			player.image[i+1] = love.graphics.newQuad(i*32, 0, 32, 32, fullImage:getDimensions())
		end
	player.spriteImage = player.image[player.currentImage]
	player.imageReflex = {}
		player.imageReflex[1] = love.graphics.newQuad(480, 0, 32, 32, fullImage:getDimensions())
		player.imageReflex[2] = love.graphics.newQuad(448, 0, 32, 32, fullImage:getDimensions())
		player.imageReflex[3] = love.graphics.newQuad(416, 0, 32, 32, fullImage:getDimensions())
		player.imageReflex[4] = love.graphics.newQuad(384, 0, 32, 32, fullImage:getDimensions())
		player.imageReflex[5] = love.graphics.newQuad(352, 0, 32, 32, fullImage:getDimensions())
		player.imageReflex[6] = love.graphics.newQuad(320, 0, 32, 32, fullImage:getDimensions())
	
	player.xTarget, player.yTarget, player.pointerKick = player.x + 32, player.y, 0
	
	player.imageTarget = love.graphics.newQuad(224, 224, 32, 32, fullImage:getDimensions())
	player.currentKick = 1
	player.imageKick = {}
		player.imageKick[1] = love.graphics.newQuad(32, 160, 32, 32, fullImage:getDimensions())
		player.imageKick[2] = love.graphics.newQuad(0, 160, 32, 32, fullImage:getDimensions())
	player.spriteKick = player.imageKick[player.currentKick]
	player.imageKickReflex = {}
		player.imageKickReflex[1] = love.graphics.newQuad(448, 160, 32, 32, fullImage:getDimensions())
		player.imageKickReflex[2] = love.graphics.newQuad(480, 160, 32, 32, fullImage:getDimensions())
	
	player.elapsedTimePl = 1
	
	player.mov = function(dt)
		player.elapsedTimePl = player.elapsedTimePl + dt
		if player.elapsedTimePl > 1 then
			if love.keyboard.isDown("right") then
				player.leftRightPointer = 0
				player.x = player.x + player.speed
				player.yTarget = player.y
				player.xTarget = player.x + 32
			end
			if love.keyboard.isDown("left") then
				player.leftRightPointer = 1
				player.x = player.x - player.speed
				player.yTarget = player.y
				player.xTarget = player.x - 32
			end
			if love.keyboard.isDown("down") then
				player.y = player.y + player.speed
				player.xTarget = player.x
				player.yTarget = player.y + 32
			end
			if love.keyboard.isDown("up") then
				player.y = player.y - player.speed
				player.xTarget = player.x
				player.yTarget = player.y - 32
			end
			if love.keyboard.isDown("z") then
				player.kickTarget()
			end
			player.elapsedTimePl = 0.9
		end
		dtPoint = dt
	end
	
	player.kickTarget = function()
		player.pointerKick = 1
	end
	
	player.elapsedTime = 1
	
	player.draw = function()
		love.graphics.draw(fullImage, player.spriteImage, player.x, player.y)
		love.graphics.draw(fullImage, player.imageTarget, player.xTarget, player.yTarget)
		if player.pointerKick == 1 then 
			love.graphics.draw(fullImage, player.spriteKick, player.x, player.y)
		end
	end
	
	player.drawUpdate = function(dt)
		player.elapsedTime = player.elapsedTime + dt
		if player.elapsedTime > 1 then
			if player.pointerKick == 1 then
				if player.leftRightPointer == 0 then
					player.spriteKick = player.imageKick[player.currentKick]
				elseif player.leftRightPointer == 1 then
					player.spriteKick = player.imageKickReflex[player.currentKick]
				end
				if player.currentKick == 1 then
					player.currentKick = 2
				elseif player.currentKick == 2 then
					player.currentKick = 1
					player.pointerKick = 0
				end
			end
			
			if player.currentImage < 6 then
				player.currentImage = player.currentImage + 1
			else 
				player.currentImage = 1
			end
			if player.leftRightPointer == 0 then
				player.spriteImage = player.image[player.currentImage]
			elseif player.leftRightPointer == 1 then
				player.spriteImage = player.imageReflex[player.currentImage]
			end
			player.elapsedTime = 0.8
		end
	end
	
	player.scope = function()
		if player.x < 32 then
			player.x = 32
		end
		if player.y < 32 then
			player.y = 32
		end
		if player.x + size*2 > love.graphics.getWidth() then
			player.x = love.graphics.getWidth() - size*2
		end
		if player.y + size*2 > love.graphics.getHeight() then
			player.y = love.graphics.getHeight() - size*2
		end
	end