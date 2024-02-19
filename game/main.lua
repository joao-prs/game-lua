function love.load()
    -- Carrega o arquivo de áudio
    audio = love.audio.newSource("song/AdhesiveWombat_Distortotron.mp3", "stream")
    
    -- Inicia a reprodução do áudio
    love.audio.play(audio)

    love.graphics.setBackgroundColor(0, 0, 0) -- Define a cor de fundo como preto (0, 0, 0)
    square = {
        x = 100,
        y = 100,
        size = 50,
        color = {1, 0, 0} -- Vermelho (R, G, B)
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

function love.conf(t)
    t.window.title = "Meu Jogo"
    t.window.width = 800
    t.window.height = 600
    t.window.vsync = true
    t.window.msaa = 0
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.resizable = true
    t.window.minwidth = 1
    t.window.minheight = 1
    t.window.borderless = false
    t.window.centered = true
    t.window.display = 1
    t.window.highdpi = false
    t.window.x = nil
    t.window.y = nil
    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.timer = true
    t.modules.window = true
    t.modules.thread = true
    t.modules.touch = true
    t.modules.video = true
    t.modules.audio = true
    t.modules.data = true
end
