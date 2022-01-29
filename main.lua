io.stdout:setvbuf("no")

require("generalFunctions")
menu = require("menu")
gameManager = require("gameManager")

function love.load()
	mouse.update()
	love.window.setMode(screen.width, screen.height)
	love.window.setTitle(screen.title)
	menu.load()
	gameState.inMenu = true
end

function love.update(dt)
	mouse.update()
	if gameState.inMenu then
		menu.update(dt)
	end
	if gameState.inGame then
		gameManager.update(dt)
	end
end
function love.keypressed(key)
	if gameState.inGame then
		gameManager.keypressed(key)
	end
end
function love.mousepressed(x, y, click)
	if gameState.inMenu then
		menu.mouseclicked(click)
	end
	if gameState.inGame then
		gameManager.mousepressed(click)
	end
end
function love.mousereleased(x, y, click)
	if gameState.inMenu then
		local choice = menu.mousereleased(click)
		if choice ~= nil then
			if choice == "Game" then
				gameState.inMenu = false
				gameManager.load()
				gameState.inGame = true
			end
		end
	end
	if gameState.inGame then
		gameManager.mousereleased(click)
	end
end

function love.draw()
	if gameState.inMenu then
		menu.draw()
	end
	if gameState.inGame then
		gameManager.draw()
	end
end