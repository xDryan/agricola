local myGUI = {}

function myGUI.newElement(pX, pY, pW, pH)
  local myElt = {}
  myElt.x = pX
  myElt.y = pY
  myElt.width = pW
  myElt.height = pH
  return myElt
end

function myGUI.newLabel(pX, pY, pText, pBg)
  local background = display.newImage("images/"..pBg..".png")
  background.anchorX = 1
  background.anchorY = 0
  background.x = pX
  background.y = pY
  local myLabel = myGUI.newElt(pX, pY, background.width, background.height) 
  myLabel.background = background
  myLabel.text = display.newText()
 
end









return myGUI