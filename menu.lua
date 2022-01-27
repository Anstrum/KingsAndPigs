require("generalFunctions")
require("maps")
local menu = {}



menu.buttons = {}
menu.font = nil
menu.title = {}
	menu.title.sprite = nil
	menu.title.x = nil
	menu.title.y = nil
	menu.title.scale = nil
	menu.title.reverse = false
menu.map = {}
menu.spriteSheet = nil

function menu.load()
	menu.font = love.graphics.newFont("Ressources/pixeled.ttf", 25)
	menu.title.sprite = love.graphics.newImage("Ressources/Kings and Pigs.png")
	menu.title.x = screen.width / 2
	menu.title.y = 50
	menu.title.scale = 1.5
	menu.addButton("Play", "Ressources/dialogueBoxes/button.png", "Ressources/dialogueBoxes/button_pressed.png", 140, 550)
	menu.addButton("Quit", "Ressources/dialogueBoxes/button.png", "Ressources/dialogueBoxes/button_pressed.png", 470, 550)
	menu.loadMap()
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

	--menu button check--
	for i = 1, #menu.buttons do
		local button = menu.buttons[i]
		if mouse.x > button.x and mouse.x < button.x + button.width and mouse.y > button.y and mouse.y < button.y + button.height then
			button.selected = true
		else
			button.selected = false
			button.clicked = false
		end
	end
end

function menu.mouseclicked(click)
	if click == 1 then
		for i = 1, #menu.buttons do
			if menu.buttons[i].selected then
				menu.buttons[i].clicked = true
				print("test")
			else
				menu.buttons[i].clicked = false
			end
		end
	end
end
function menu.mousereleased(click)
	if click == 1 then
		for i = 1, #menu.buttons do
			if menu.buttons[i].clicked then
				if menu.buttons[i].name == "Play" then
					print("test")
				end
				if menu.buttons[i].name == "Quit" then
					love.event.quit()
				end
			end
		end
	end
	for i = 1, #menu.buttons do
		menu.buttons[i].clicked = false
		menu.buttons[i].selected = false
	end
end

function menu.draw()
	--Draw map--
	for i = 1, #menu.map do
		for j = 1, #menu.map[i] do
			love.graphics.draw(menu.asset.mainImage, menu.asset.quads[menu.map[j][i]], (i - 1) * 32, (j - 1) * 32)
		end
	end

	--title picture draw--
	love.graphics.draw(menu.title.sprite, screen.width / 2 - (menu.title.sprite:getWidth() * menu.title.scale) / 2, 50, 0, menu.title.scale, menu.title.scale)

	--Buttons draw--
	for i = 1, #menu.buttons do
		if menu.buttons[i].clicked then
			love.graphics.draw(menu.buttons[i].spritePressed, menu.buttons[i].x, menu.buttons[i].y + 5)
			love.graphics.draw(menu.buttons[i].text, (menu.buttons[i].x + menu.buttons[i].width / 2) - menu.buttons[i].text:getWidth() / 2, (menu.buttons[i].y + menu.buttons[i].height / 2) - menu.buttons[i].text:getWidth() / 2 + 5)
		else
			love.graphics.draw(menu.buttons[i].sprite, menu.buttons[i].x, menu.buttons[i].y)
			love.graphics.draw(menu.buttons[i].text, (menu.buttons[i].x + menu.buttons[i].width / 2) - menu.buttons[i].text:getWidth() / 2, (menu.buttons[i].y + menu.buttons[i].height / 2) - menu.buttons[i].text:getWidth() / 2)
		end
	end
end



function menu.addButton(text, sprite, spritePressed, x, y)
	local myButton = {}
		myButton.name = text
		myButton.text = love.graphics.newText(menu.font, myButton.name)
		myButton.sprite = love.graphics.newImage(sprite)
		myButton.spritePressed = love.graphics.newImage(spritePressed)
		myButton.x = x
		myButton.y = y
		myButton.width = myButton.sprite:getWidth()
		myButton.height = myButton.sprite:getHeight()
		myButton.selected = false
		myButton.clicked = false
	table.insert(menu.buttons, myButton)
end

function menu.loadMap()
	menu.asset = loadQuads("Ressources/TileMap/Terrain.png", 32, 32)
	menu.map = maps.getMenu()
end
return menu