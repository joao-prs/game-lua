-- variaveis
local telaCheia = false

-- funcoes
local fullscreen = {}

-- key_ F11
function fullscreen.love_keypressed(key, scancode, isrepeat)
    if key == "f11" then
        telaCheia = not telaCheia
        love.window.setFullscreen(telaCheia, "exclusive")
    end
end
return fullscreen
