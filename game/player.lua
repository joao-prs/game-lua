-- Player.lua
local Player = {}


local x, y = 100, 100
local speed = 200
local diagonalSpeed = 0.7 -- multiplica a velocidade por valor inferior a 1
local playerSprite
local frameWidth, frameHeight = 48, 48 -- Tamanho de cada quadro do sprite
local framesPerSecond = 6 -- Número de quadros por segundo
local frameTimer = 0
local currentFrame = 1


local function isOppositeDirection(dir1, dir2)
    return (dir1 == "up" and dir2 == "down") or
           (dir1 == "down" and dir2 == "up") or
           (dir1 == "left" and dir2 == "right") or
           (dir1 == "right" and dir2 == "left")
end


function Player.load()
    -- Não é necessário carregar nada neste exemplo
    playerSprite = love.graphics.newImage("sprite/player.png")
end

function Player.update(dt)
    local dx, dy = 0, 0


    if love.keyboard.isDown("up") then
        dy = dy - 1
        currentRow = 6
    elseif love.keyboard.isDown("down") then
        dy = dy + 1
        currentRow = 4
    elseif love.keyboard.isDown("left") then
        dx = dx - 1
        currentRow = 5
    elseif love.keyboard.isDown("right") then
        dx = dx + 1
        currentRow = 3
    else
        currentRow = 1
    end

    if dx ~= 0 or dy ~= 0 then
        -- Atualiza a animação do sprite apenas se estiver se movendo
        frameTimer = frameTimer + dt
        if frameTimer >= 1 / framesPerSecond then
            currentFrame = currentFrame % 6 + 1
            frameTimer = 0
        end
    else
        -- Reseta a animação se o sprite não estiver se movendo
        currentFrame = 1
    end
    if dx ~= 0 and dy ~= 0 then
        -- Reduz a velocidade quando se move nas diagonais
        dx = dx * diagonalSpeed
        dy = dy * diagonalSpeed
  
    end

    x = x + dx * speed * dt
    y = y + dy * speed * dt
end

function Player.draw()
    --love.graphics.rectangle("fill", x, y, 50, 50)
    --love.graphics.draw(playerSprite, x, y)
    local scaleX = 1
    if love.keyboard.isDown("left") then
        scaleX = -1 -- Inverte horizontalmente se estiver indo para a esquerda
    end

--    local quad = love.graphics.newQuad((currentFrame - 1) * frameWidth, 0, frameWidth, frameHeight, playerSprite:getDimensions())
--    love.graphics.draw(playerSprite, quad, x, y)
--end
local quad = love.graphics.newQuad((currentFrame - 1) * frameWidth, (currentRow - 1) * frameHeight, frameWidth, frameHeight, playerSprite:getDimensions())
    love.graphics.draw(playerSprite, quad, x, y, 0, scaleX, 1) -- Escala X negativa para inverter horizontalmente
end



function Player.keypressed(key)
    -- Você pode adicionar manipulação de teclas adicionais aqui, se necessário
end

return Player