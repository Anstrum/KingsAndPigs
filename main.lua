io.stdout:setvbuf("no")

require("generalFunctions")
menu = require("menu")

function love.load()
	love.window.setMode(screen.width, screen.height)
	love.window.setTitle(screen.title)
	menu.load()
	gameState.inMenu = true
end

function love.update(dt)
	if gameState.inMenu then
		menu.update(dt)
	end
end

function love.draw()
	if gameState.inMenu then
		menu.draw()
	end
end




--[[
	TODO:
		-print background to the menu
		-print text to menu buttons
		-create button reactions (enter the game or quit it)


		{{OPTIONNAL}}
		-create character animation in the menu:
			-create character factory and draw it on the menu
			-create character movements (Q and D) with no collisions
			-create collisions
			-create menu interractions with the character
]]
