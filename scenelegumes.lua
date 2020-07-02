local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local GUI = require "gui"
local legumes = require "legumes"

function scene:create( event )
	local sceneGroup = self.view
  
  local background = display.newImageRect("images/fond.png", 1280, 720)
  background.anchorX = 0
  background.anchorY = 0
  sceneGroup:insert(background)
  
  local barre = display.newImage("images/barre.png")
  barre.anchorX = 0
  barre.anchorY = 0
  barre.x = 27
  barre.y = 27
  sceneGroup:insert(barre)
  
  
  local function actionFermer( event )
    composer.gotoScene("scenejeu", "fade", 50)
  end
  
  local fermer = display.newImage("images/close.png")
  fermer.anchorX = 1
  fermer.anchorY = 0
  fermer.x = display.actualContentWidth - 32
  fermer.y = 29
  fermer:addEventListener("tap", actionFermer)
  sceneGroup:insert(fermer)
  
  local function actionLegume( event )
    local legume = event.target.name
    if argent >= legumes.prix[legume] and energieActuelle > 0 then
      argent = argent - legumes.prix[legume]
      elementCourant = legume
      composer.gotoScene("scenejeu")
    end
  end
  
  local posX = 25
  local posY = barre.y + barre.height + 15
  for i = 1, #legumes.listeLegumes do
    local legume = GUI.newLegume(posX, posY, legumes.listeLegumes[i], "images/legume.png", "images/legume_label.png", 30, sceneGroup)
    legume.image:addEventListener("tap", actionLegume)
    posX = posX + legume.image.width + 15
    if posX + legume.image.width + 15 > display.actualContentWidth then
      posX = 25
      posY = posY + legume.height + 15
    end
  end
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Exécuté avant que la scène ne vienne à l'écran
	elseif phase == "did" then
		-- Exécuté une fois que la scène est à l'écran
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
    -- Exécuté juste avant que la scène ne disparaisse de l'écran
	elseif phase == "did" then
		-- Exécuté après que la scène ai disparu de l'écran
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
  -- Exécuté à la suppression de la scène de la mémoire
	-- Supprimez ici les objets que vous avez créés
end

---------------------------------------------------------------------------------

-- Branchement des événements
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene