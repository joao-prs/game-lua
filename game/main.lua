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
    
    -- Carrega o arquivo de áudio
    audio = love.audio.newSource("song/AdhesiveWombat_Distortotron.mp3", "stream")
    -- Inicia a reprodução do áudio
    love.audio.play(audio)
    
    love.graphics.setBackgroundColor(0, 0, 0) -- Define a cor de fundo como preto (0, 0, 0)
    square = {
        x = 100,
        y = 100,
        size = 50,
        color = {0.5, 0, 0} -- Vermelho (R, G, B)
    }
end

function love.draw()
    love.graphics.setColor(square.color) -- Define a cor para o quadrado
    love.graphics.rectangle("fill", square.x, square.y, square.size, square.size) -- Desenha um retângulo preenchido (quadrado)
end


local fullscreen = require("fullscreen")
function love.keypressed(key, scancode, isrepeat)
    fullscreen.love_keypressed(key, scancode, isrepeat)
end


-- finalizar
function love.quit()
    love.audio.stop()
end