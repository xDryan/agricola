local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"

function scene:create( event )
	local sceneGroup = self.view
  
  local fond = display.newImageRect("images/fond_base.png", 1280, 720)
  fond.anchorX = 0
  fond.anchorY = 0
  sceneGroup:insert(fond)
  
  local function onPressPlay()
    composer.gotoScene("scenejeu", "fade", 500)
    return true
  end
  
  local boutonJouer = widget.newButton({
      x = display.actualContentWidth/2,
      y = display.actualContentHeight/2,
      label = "Jouer",
      labelColor = {default = {0, 0, 0} },
      onRelease = onPressPlay,
      shape = "roundRect",
      fillColor = { default = {1, 0.2, 0.5, 0.7}, over = {1, 0.2, 0.5, 1} }
    })

  sceneGroup:insert(boutonJouer)
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