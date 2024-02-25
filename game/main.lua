-- local var
local player = require("player")
local player_colisor = require("player_colisor")
local fullscreen = require("fullscreen")
local zoom = 3 -- Fator de zoom

-- main
function love.load()
    love.window.setTitle("Prototipo 1")
    --love.window.setFullscreen(false, "exclusive")
    
    -- Define a resolução da janela
    love.window.setMode(1200, 800, {
        resizable = true,  -- Permite redimensionar a janela
        minwidth = 400,    -- Largura mínima da janela
        minheight = 300    -- Altura mínima da janela
    })
    
    ---- Carrega o arquivo de áudio
    --audio = love.audio.newSource("song/AdhesiveWombat_Distortotron.mp3", "stream")
    ---- Inicia a reprodução do áudio
    --love.audio.play(audio)
    
    -- player
    player.load()
    --player_colisor.load()
end


function love.update(dt)
    player.update(dt, player_colisor.x + 24, player_colisor.y + 24)
    player_colisor.update(dt)
end

function love.draw()
    love.graphics.scale(zoom)
    player.draw(player_colisor.x, player_colisor.y)
    player_colisor.draw()
end

function love.keypressed(key)
    player.keypressed(key)
    player_colisor.keypressed(key)
    fullscreen.love_keypressed(key, scancode, isrepeat)
end

-- finalizar -----------------------------------------------------------------------
function love.quit()
    -- love.audio.stop()
end