require "player"

location = {}
	--location.fullImage = love.graphics.newImage("Sprites/SpriteSheet.png")
	location.currentImage = 1
	location.imageFloor = {}
		for i = 0, 7 do
			location.imageFloor[i+1] = love.graphics.newQuad(i*32, 128, 32, 32, fullImage:getDimensions())
		end
	location.imageWall = {}
		location.imageWall[1] = love.graphics.newQuad(32, 96, 32, 32, fullImage:getDimensions())
		location.imageWall[2] = love.graphics.newQuad(64, 96, 32, 32, fullImage:getDimensions())
		location.imageWall[3] = love.graphics.newQuad(128, 96, 32, 32, fullImage:getDimensions())
		--locations.spriteImage = locations.image[locations.currentImage]
	
	location.width = love.graphics.getWidth()
	location.height = love.graphics.getHeight()
	location.wall = {}
	location.massWall = function ()
		location.w = location.width/32
		location.h = location.height/32
		--location.wall = {}
		for i = 0, location.w do
			location.wall[i] = {}
			for j = 0, location.h do
				if j == 0 then
					location.wall[i][j] = love.math.random(1, 3)
				elseif j == location.h then
					location.wall[i][j] = love.math.random(1, 3)
				elseif i == 0 then
					location.wall[i][j] = love.math.random(1, 3)
				elseif i == location.w then
					location.wall[i][j] = love.math.random(1, 3)
				end
			end
		end
	end
	
	location.drawWall = function ()
		for i = 0, location.width - 32, 32 do
			for j = 0, location.height - 32, 32 do
				if j == 0 then
					love.graphics.draw(fullImage, location.imageWall[location.wall[i/32][j/32]], i, j)
				elseif j == location.height - 32 then
					love.graphics.draw(fullImage, location.imageWall[location.wall[(i+32)/32][(j+32)/32]], i, j)
				elseif i == 0 then
					love.graphics.draw(fullImage, location.imageWall[location.wall[i/32][j/32]], i, j)
				elseif i == location.width - 32 then
					love.graphics.draw(fullImage, location.imageWall[location.wall[(i+32)/32][(j+32)/32]], i, j)
				end
			end
		end
	end
	
	location.draw = function()
		for i = 32, location.width - 64, 32 do
			for j = 32, location.height - 64, 32 do
				if location.currentImage < 8 then
					love.graphics.draw(fullImage, location.imageFloor[location.currentImage], i, j)
					location.currentImage = location.currentImage + 1
				else 
					love.graphics.draw(fullImage, location.imageFloor[location.currentImage], i, j)
					location.currentImage = 1
				end
			end
		end
	end