local menu = {}

menu.buttons = {}
menu.title = {}
	menu.title.sprite = nil
	menu.title.x = nil
	menu.title.y = nil
	menu.title.scale = nil
	menu.title.reverse = false

function menu.load()
	menu.title.sprite = love.graphics.newImage("Ressources/Kings and Pigs.png")
	menu.title.x = screen.width / 2
	menu.title.y = 50
	menu.title.scale = 1.5
	addButton("Play", "Ressources/dialogueBoxes/button.png", "Ressources/dialogueBoxes/button_pressed.png", 140, 700)
	addButton("Quit", "Ressources/dialogueBoxes/button.png", "Ressources/dialogueBoxes/button_pressed.png", 470, 700)
end

function menu.update(dt)
	--title animation--
	if not menu.title.reverse then
		menu.title.scale = menu.title.scale + 0.4 * dt
		if menu.title.scale > 2 then
			menu.title.reverse = true
		end
	else
		menu.title.scale = menu.title.scale - 0.4 * dt
		if menu.title.scale < 1.5 then
			menu.title.reverse = false
		end
	end


end

function menu.draw()
	--title picrture draw--
	love.graphics.draw(menu.title.sprite, 800 / 2 - (menu.title.sprite:getWidth() * menu.title.scale) / 2, 50, 0, menu.title.scale, menu.title.scale)


	--Buttons draw--
	for i = 1, #menu.buttons do
		if menu.buttons[i].clicked then
			love.graphics.draw(menu.buttons[i].spritePressed, menu.buttons[i].x, menu.buttons[i].y)
		else
			love.graphics.draw(menu.buttons[i].sprite, menu.buttons[i].x, menu.buttons[i].y)
		end
	end
end



function addButton(text, sprite, spritePressed, x, y)
	local myButton = {}
		myButton.name = text
		myButton.sprite = love.graphics.newImage(sprite)
		myButton.spritePressed = love.graphics.newImage(spritePressed)
		myButton.x = x
		myButton.y = y
		myButton.width = myButton.sprite:getWidth()
		myButton.height = myButton.sprite:getHeight()
		myButton.clicked = false
	table.insert(menu.buttons, myButton)
end

return menu