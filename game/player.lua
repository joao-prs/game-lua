-- Player.lua
local Player = {}


--local x, y = 100, 100

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
    playerSprite = love.graphics.newImage("sprite/player_1.png")
    -- sprite atualizado
end

function Player.update(dt, quadX, quadY)

    -- movimento vestical
    if love.keyboard.isDown("up") then
        currentRow = 7
        movendo = true
        direcao = "cima"
    elseif love.keyboard.isDown("down") then
        currentRow = 5
        movendo = true
        direcao = "baixo"
    end

    -- movimento horizontal
    if love.keyboard.isDown("left") then
        currentRow = 8
        --spriteScaleX = -1 -- Define a escala X como -1
        direcao = "esquerda"
        movendo = true
    elseif love.keyboard.isDown("right") then
        currentRow = 6
        --spriteScaleX = 1 -- Define a escala X como 1 (normal)
        direcao = "direita"
        movendo = true
    end

    if not love.keyboard.isDown("up") and not love.keyboard.isDown("down") and not love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
        movendo = false
    end

    -- animacoes dele parado para cada direcao
    if movendo == false and direcao == "cima" then
        currentRow = 3
        print("parado_cima \n")
    elseif movendo == false and direcao == "esquerda" then
        currentRow = 4
        --spriteScaleX = -1
        print("parado_esquerda \n")
    elseif movendo == false and direcao == "direita" then
        currentRow = 2
        --spriteScaleX = 1
        print("parado_direita \n")
    elseif movendo == false and direcao == "baixo" then
        currentRow = 1
        print("parado_baixo \n")
    end

    -- Atualiza a animação do sprite
    frameTimer = frameTimer + dt
    if frameTimer >= 1 / framesPerSecond then
        currentFrame = currentFrame % 6 + 1
        frameTimer = 0
    end
end


function Player.draw(quadX, quadY)
    local quad = love.graphics.newQuad((currentFrame - 1) * frameWidth, (currentRow - 1) * frameHeight, frameWidth, frameHeight, playerSprite:getDimensions())
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(playerSprite, quad, quadX, quadY, 0, spriteScaleX, 1)
end

function Player.keypressed(key)
    -- Você pode adicionar manipulação de teclas adicionais aqui, se necessário
end

return Player