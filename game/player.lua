-- Player.lua
local Player = {}


local x, y = 100, 100
local speed = 75
local diagonalSpeed = 0.7 -- multiplica a velocidade por valor inferior a 1
local playerSprite
local frameWidth, frameHeight = 48, 48 -- Tamanho de cada quadro do sprite
local framesPerSecond = 6 -- Número de quadros por segundo
local frameTimer = 0
local currentFrame = 1
local currentRow = 1 -- Linha atual do sprite
local spriteScaleX = 1 -- Escala X do sprite (1: normal, -1: invertido)
local direcao = "baixo"
local movendo = false



function Player.load()
    -- Não é necessário carregar nada neste exemplo
    playerSprite = love.graphics.newImage("sprite/player.png")
end

function Player.update(dt)
    local dx, dy = 0, 0


    if love.keyboard.isDown("up") then
        dy = dy - 1
        currentRow = 6
        direcao = "cima"
        movendo = true
    elseif love.keyboard.isDown("down") then
        dy = dy + 1
        currentRow = 4
        direcao = "baixo"
        movendo = true
    end
    
    if love.keyboard.isDown("left") then
        dx = dx - 1
        currentRow = 5
        spriteScaleX = -1 -- Define a escala X como -1 para inverter horizontalmente
        direcao = "direita"
        movendo = true
    elseif love.keyboard.isDown("right") then
        dx = dx + 1
        currentRow = 5
        spriteScaleX = 1 -- Define a escala X como 1 para manter a orientação normal
        direcao = "esquerda"
        movendo = true
    else
        --currentRow = 1
        movendo = false
    end

    -- animacoes dele parado para cada direcao
    if movendo == false and direcao == "cima" then
        currentRow = 3
    elseif movendo == false and direcao == "esquerda" then
        currentRow = 2
        spriteScaleX = -1
    elseif movendo == false and direcao == "direita" then
        currentRow = 2
        spriteScaleX = 1
    elseif movendo == false and direcao == "baixo" then
        currentRow = 1
    end

    -- Atualiza a animação do sprite
    frameTimer = frameTimer + dt
    if frameTimer >= 1 / framesPerSecond then
        currentFrame = currentFrame % 6 + 1
        frameTimer = 0
    end

    -- Verifica se ambas as direções estão ativas
    if dx ~= 0 and dy ~= 0 then
        -- Reduz a velocidade quando o movimento é diagonal
        dx = dx * speed * diagonalSpeed
        dy = dy * speed * diagonalSpeed
    else
        -- Mantém a velocidade normal se o movimento não for diagonal
        dx = dx * speed
        dy = dy * speed
    end

    x = x + dx * dt
    y = y + dy * dt

end



function Player.draw()

    local offsetX = 0
    if spriteScaleX == -1 then
        offsetX = frameWidth
    end

    local quad = love.graphics.newQuad((currentFrame - 1) * frameWidth, (currentRow - 1) * frameHeight, frameWidth, frameHeight, playerSprite:getDimensions())
    love.graphics.draw(playerSprite, quad, x - offsetX, y, 0, spriteScaleX, 1)
end



function Player.keypressed(key)
    -- Você pode adicionar manipulação de teclas adicionais aqui, se necessário
end

return Player