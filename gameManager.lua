local gameManager = {}

function gameManager.load()
	print("game loading")
end


function gameManager.update(dt)
	print("game update")
end


function gameManager.draw()
	print("game draw")
end


function gameManager.keypressed(key)
	print("pressed:"..key)
end


function gameManager.mousepressed(click)
end


function gameManager.mousereleased(click)
end


return gameManager