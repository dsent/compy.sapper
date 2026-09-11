require("config")
require("constants")
require("variables")
require("functions")

--- *** event handlers and initialization ***

function readyInput()
  function singleclick(x, y)
    actionNextMode()
    sfx.jump()
  end
  function doubleclick(x, y)
    actionUser(flowStart, x, y)
    actionUser(actionUnlock, x, y)
  end
end

function startedInput()
  function singleclick(x, y)
    actionUser(actionFlag, x, y)
  end
  function doubleclick(x, y)
    actionUser(actionUnlock, x, y)
  end
end

function gameoverInput()
  singleclick = nil
  function doubleclick(x, y)
    actionInit()
    sfx.beep()
  end
end

compy.input.hooks.singleclick = function(x, y)
  if singleclick then
    singleclick(x, y)
  end
  return true
end

compy.input.hooks.doubleclick = function(x, y)
  if doubleclick then
    doubleclick(x, y)
  end
  return true
end

-- The board owns the pointer and keyboard for the whole run:
-- ordinary presses and stray keys must not reach the console
-- beneath it, while reserved host controls are handled before
-- the project route.
compy.input.hooks.mousepressed = function()
  return true
end

compy.input.hooks.keypressed = function()
  return true
end

compy.input.hooks.textinput = function()
  return true
end

initialize()
