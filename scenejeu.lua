local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local GUI = require "gui"

function scene:create( event )
	local sceneGroup = self.view
  

  local lblEnergie = GUI.newLabel(display.actualContentWidth - 15, 15, "Energie", "images/energie.png", 30)
  local lblArgent = GUI.newLabel(display.actualContentWidth - 15, 30 + lblEnergie.background.height, "Argent", "images/argent.png", 30)

  local function actionBoutonTest()
    print("TODO : Ouverture de la liste des légumes à planter")
  end

  local btnLegumes = GUI.newButton(15, display.actualContentHeight - 15, "Légumes", "images/bouton_bas.png", 25, actionBoutonTest)
  
  sceneGroup:insert(lblEnergie.background)
  sceneGroup:insert(lblEnergie.text)
  sceneGroup:insert(lblArgent.background)
  sceneGroup:insert(lblArgent.text)
  sceneGroup:insert(btnLegumes)
  
  
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