local widget = require "widget"
local legumes = require "legumes"

local myGUI = {}

function myGUI.newLabel(pX, pY, pText, pBackgroundFile, pFontSize)
  local myLabel = {}
  local background = display.newImage(pBackgroundFile)
  background.anchorX = 1
  background.anchorY = 0
  background.x = pX
  background.y = pY
  local text = display.newText(pText, 0, 0 - 3, native.systemFont, pFontSize)
  text:setFillColor(0, 0, 0)
  text.anchorX = 1
  text.anchorY = 0
  local posX = pX - (background.width - text.width)/2
  local posY = pY + (background.height - text.height)/2
  text.x = posX
  text.y = posY
  myLabel.background = background
  myLabel.text = text
  myLabel.width = background.width
  myLabel.height = background.height
  return myLabel
end

function myGUI.newLegume(pX, pY, pNom, pImgLegume, pBackground, pFontSize, pSceneGroup)
  local myLegume = {}
  local image = display.newImage(pImgLegume)
  image.anchorX = 0
  image.anchorY = 0
  image.x = pX
  image.y = pY
  image.name = pNom
  pSceneGroup:insert(image)
  local posX = pX
  local posY = pY + image.height + 5
  local label = myGUI.newLabel(posX, posY, pNom, pBackground, pFontSize)
  label.background.anchorX = 0
  label.background.anchorY = 0
  label.text.anchorX = 0
  label.text.anchorY = 0
  label.text.x = pX + (label.background.width - label.text.width)/2
  label.text:setFillColor(1, 1, 1)
  pSceneGroup:insert(label.background)
  pSceneGroup:insert(label.text)
  myLegume.image = image
  myLegume.label = label
  myLegume.width = image.width
  myLegume.height = image.height + 5 + label.height
  return myLegume
end

function myGUI.newButton(pX, pY, pText, pBackgroundFile, pFontSize, pAction)
  local function retirerSelection( event )
    if elementCourant ~= nil then
      argent = argent + legumes.prix[elementCourant]
      elementCourant = nil
    end
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
  
  myButton:addEventListener("touch", retirerSelection)
  
  return myButton
end

return myGUI
