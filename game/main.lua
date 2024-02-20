


function love.load()
    love.window.setTitle("Prototipo 1")
    love.window.setFullscreen(false, "exclusive")
    love.window.width = 800
    love.window.height = 600
    love.window.setVSync(2)
    love.window.msaa = 0
    love.window.resizable = true
    love.window.minwidth = 1
    love.window.minheight = 1
    love.window.borderless = false
    love.window.centered = true
    love.window.display = 1
    love.window.highdpi = false
    love.window.x = nil
    love.window.y = nil
    
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



function love.quit()
    -- Para a reprodução do áudio quando o programa é encerrado
    love.audio.stop()
end


function love.draw()
    love.graphics.setColor(square.color) -- Define a cor para o quadrado
    love.graphics.rectangle("fill", square.x, square.y, square.size, square.size) -- Desenha um retângulo preenchido (quadrado)
end









local fullscreen = require("fullscreen")

function love.keypressed(key, scancode, isrepeat)
    fullscreen.love_keypressed(key, scancode, isrepeat)
end