local pieceStructures = {
	{
		{
			{ " ", " ", " ", " " },
			{ "i", "i", "i", "i" },
			{ " ", " ", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "i", " ", " " },
			{ " ", "i", " ", " " },
			{ " ", "i", " ", " " },
			{ " ", "i", " ", " " },
		},
	},
	{
		{
			{ " ", " ", " ", " " },
			{ " ", "o", "o", " " },
			{ " ", "o", "o", " " },
			{ " ", " ", " ", " " },
		},
	},
	{
		{
			{ " ", " ", " ", " " },
			{ "j", "j", "j", " " },
			{ " ", " ", "j", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "j", " ", " " },
			{ " ", "j", " ", " " },
			{ "j", "j", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ "j", " ", " ", " " },
			{ "j", "j", "j", " " },
			{ " ", " ", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "j", "j", " " },
			{ " ", "j", " ", " " },
			{ " ", "j", " ", " " },
			{ " ", " ", " ", " " },
		},
	},
	{
		{
			{ " ", " ", " ", " " },
			{ "l", "l", "l", " " },
			{ "l", " ", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "l", " ", " " },
			{ " ", "l", " ", " " },
			{ " ", "l", "l", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", " ", "l", " " },
			{ "l", "l", "l", " " },
			{ " ", " ", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ "l", "l", " ", " " },
			{ " ", "l", " ", " " },
			{ " ", "l", " ", " " },
			{ " ", " ", " ", " " },
		},
	},
	{
		{
			{ " ", " ", " ", " " },
			{ "t", "t", "t", " " },
			{ " ", "t", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "t", " ", " " },
			{ " ", "t", "t", " " },
			{ " ", "t", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "t", " ", " " },
			{ "t", "t", "t", " " },
			{ " ", " ", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "t", " ", " " },
			{ "t", "t", " ", " " },
			{ " ", "t", " ", " " },
			{ " ", " ", " ", " " },
		},
	},
	{
		{
			{ " ", " ", " ", " " },
			{ " ", "s", "s", " " },
			{ "s", "s", " ", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ "s", " ", " ", " " },
			{ "s", "s", " ", " " },
			{ " ", "s", " ", " " },
			{ " ", " ", " ", " " },
		},
	},
	{
		{
			{ " ", " ", " ", " " },
			{ "z", "z", " ", " " },
			{ " ", "z", "z", " " },
			{ " ", " ", " ", " " },
		},
		{
			{ " ", "z", " ", " " },
			{ "z", "z", " ", " " },
			{ "z", " ", " ", " " },
			{ " ", " ", " ", " " },
		},
	},
}

function love.load()
	love.graphics.setBackgroundColor(255, 255, 255)

	gridXCount = 10
	gridYCount = 18

	inert = {}
	for y = 1, gridYCount do
		inert[y] = {}
		for x = 1, gridXCount do
			inert[y][x] = " "
		end
	end

	pieceType = 1
	pieceRotation = 1
  pieceX = 3
  pieceY = 0
end

function love.update() end

function love.keypressed(key)
	if key == "x" then
		pieceRotation = pieceRotation + 1
		if pieceRotation > #pieceStructures[pieceType] then
			pieceRotation = 1
		end
	elseif key == "z" then
		pieceRotation = pieceRotation - 1
		if pieceRotation < 1 then
			pieceRotation = #pieceStructures[pieceType]
		end
	end
end

function love.draw()
	local function drawBlock(block, x, y)
		local colors = {
			[" "] = { 0.87, 0.87, 0.87 },
			i = { 0.47, 0.76, 0.94 },
			j = { 0.93, 0.91, 0.42 },
			l = { 0.49, 0.85, 0.76 },
			o = { 0.92, 0.69, 0.47 },
			s = { 0.83, 0.54, 0.93 },
			t = { 0.97, 0.58, 0.77 },
			z = { 0.66, 0.83, 0.46 },
		}
		local color = colors[block]
		love.graphics.setColor(color)

		local blockSize = 20
		local blockDrawSize = blockSize - 1
		love.graphics.rectangle("fill", (x - 1) * blockSize, (y - 1) * blockSize, blockDrawSize, blockDrawSize)
	end

	for y = 1, gridYCount do
		for x = 1, gridXCount do
			drawBlock(inert[y][x], x, y)
		end
	end

	for y = 1, 4 do
		for x = 1, 4 do
			local block = pieceStructures[pieceType][pieceRotation][y][x]
			if block ~= " " then
				drawBlock(block, x, y)
			end
		end
	end
end
