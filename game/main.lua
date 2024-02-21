-- local var
local player = require("player")
local fullscreen = require("fullscreen")
local zoom = 3 -- Fator de zoom

-- main
function love.load()
    love.window.setTitle("Prototipo 1")
    love.window.setFullscreen(false, "exclusive")
    
    -- Define a resolução da janela
    love.window.setMode(1200, 800, {
        resizable = true,  -- Permite redimensionar a janela
        minwidth = 400,    -- Largura mínima da janela
        minheight = 300    -- Altura mínima da janela
    })
    
    --- -- Carrega o arquivo de áudio
    --- audio = love.audio.newSource("song/AdhesiveWombat_Distortotron.mp3", "stream")
    --- -- Inicia a reprodução do áudio
    --- love.audio.play(audio)

    -- player
    player.load()
end

-- funcao rezise tela
function love.keypressed(key, scancode, isrepeat)
    fullscreen.love_keypressed(key, scancode, isrepeat)
end



function love.update(dt)
    player.update(dt)
end

function love.draw()
    love.graphics.scale(zoom)
    player.draw()
end

function love.keypressed(key)
    player.keypressed(key)
end

-- finalizar -----------------------------------------------------------------------
function love.quit()
    -- love.audio.stop()
end