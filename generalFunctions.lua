screen = {}
	screen.width = 800
	screen.height = 800
	screen.title = "Kings and Pigs"

mouse = {}
	mouse.x = 0
	mouse.y = 0
	function mouse.update()
		mouse.x = love.mouse.getX()
		mouse.y = love.mouse.getY()
	end


gameState = {}
	gameState.inMenu = false
	gameState.inGame = false

function loadQuads(fileName, width, height)
	local myAsset = {}
	myAsset.mainImage = love.graphics.newImage(fileName)
	myAsset.tileWidth = width
	myAsset.tileHeight = height
	myAsset.quads = {}
	for i = 1, myAsset.mainImage:getHeight() / myAsset.tileWidth do
		for j = 1, myAsset.mainImage:getWidth() / myAsset.tileHeight do
			table.insert(myAsset.quads, love.graphics.newQuad((j - 1) * myAsset.tileWidth, (i - 1) * myAsset.tileHeight, myAsset.tileWidth, myAsset.tileHeight, myAsset.mainImage:getDimensions()))
		end
	end
	print("Quads length "..#myAsset.quads)
	return myAsset
end