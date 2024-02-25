-- purple_square.lua
local Player_colisor = {}

--local x, y = 100, 100
Player_colisor.x = 101
Player_colisor.y = 102
local speed = 75
local diagonalSpeed = 0.7 -- multiplica a velocidade por valor inferior a 1

function Player_colisor.update(dt)
    local dx, dy = 0, 0

    -- movimento vestical
    if love.keyboard.isDown("up") then
        dy = dy - 1
    elseif love.keyboard.isDown("down") then
        dy = dy + 1
    end

    -- movimento horizontal
    if love.keyboard.isDown("left") then
        dx = dx - 1
    elseif love.keyboard.isDown("right") then
        dx = dx + 1
    end


    -- Verifica se ambas as direções estão ativas
    if dx ~= 0 and dy ~= 0 then
        -- Reduz a velocidade quando o movimento é diagonal
        dx = dx * speed * diagonalSpeed
        dy = dy * speed * diagonalSpeed
    else
        -- velocidade normal se o movimento não for diagonal
        dx = dx * speed
        dy = dy * speed
    end

    Player_colisor.x = Player_colisor.x + dx * dt
    Player_colisor.y = Player_colisor.y + dy * dt
end

function Player_colisor.draw()
    love.graphics.setColor(1, 0, 1, 0.01)  -- Cor roxa
    love.graphics.rectangle("fill", Player_colisor.x, Player_colisor.y, 48, 48)  -- Quadrado roxo
end

function Player_colisor.keypressed(key)
    -- Você pode adicionar manipulação de teclas adicionais aqui, se necessário
end



return Player_colisor
