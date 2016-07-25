menu = {}
	
	menu.button = {}
		menu.button.spawn = function(text, x, y)
			table.insert(menu.button, {text = text, x = x, y = y})
		end
	
	menu.draw = function()
		for i, v in ipairs(menu.button) do
			love.graphics.print(v.text, v.x, v.y)
		end
	end