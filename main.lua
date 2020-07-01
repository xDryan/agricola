widget = require "widget"


imgBouton = graphics.newImageSheet("images/energie.png", {})
bouton = widget.newButton({x = 50, y = 50, isEnabled = false, sheet=imgBouton})
bouton:setLabel("Test")

