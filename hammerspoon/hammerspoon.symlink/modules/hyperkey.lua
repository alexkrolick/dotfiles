-- Based on https://gist.github.com/prenagha/1c28f71cb4d52b3133a4bff1b3849c3e

-- A global variable for the sub-key Hyper Mode
k = hs.hotkey.modal.new({}, 'F19')

-- Hyper+key for all the below are setup somewhere
-- The handler already exists, usually in Keyboard Maestro
-- we just have to get the right keystroke sent
hyperBindings = {'c','r','f'}

for i,key in ipairs(hyperBindings) do
  k:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
    k.triggered = true
  end)
end

-- Enter Hyper Mode when F19 (left control) is pressed
pressedF19 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F19 (left control) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF19 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f19 = hs.hotkey.bind({}, 'F19', pressedF19, releasedF19)