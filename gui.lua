local widget = require "widget"

local myGUI = {}

function myGUI.newLabel(pX, pY, pText, pBackgroundFile, pFontSize)
  local myLabel = {}
  local background = display.newImage(pBackgroundFile)
  background.anchorX = 1
  background.anchorY = 0
  background.x = pX
  background.y = pY
  local text = display.newText(pText, 0, 0 - 3, native.systemFont, pFontSize)
  text.anchorX = 1
  text.anchorY = 0
  local posX = pX - (background.width - text.width)/2
  local posY = pY + (background.height - text.height)/2
  text.x = posX
  text.y = posY
  myLabel.background = background
  myLabel.text = text
  return myLabel
end

function myGUI.newButton(pX, pY, pText, pBackgroundFile, pFontSize, pAction)
  local function testAction()
    print("OK")
    return true
  end
  local myButton = widget.newButton(
    {
      x = pX,
      y = pY,
      label = pText,
      fontSize = pFontSize,
      labelColor = { default = {1, 1, 1}, over = {0, 0, 0} },
      onPress = pAction,
      defaultFile = pBackgroundFile
    })
  myButton.anchorX = 0
  myButton.anchorY = 1
  return myButton
end

return myGUI
