local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local GUI = require "gui"
local legumes = require "legumes"


local function ajouterTerrain(pX, pY, pScenegroup)
  local terrain = display.newImage("images/terrain_fond.png")
  terrain.anchorX = 0
  terrain.anchorY = 1
  terrain.x = pX
  terrain.y = pY
  pScenegroup:insert(terrain)
  
  local X = pX + 5
  local Y = pY - 5
  local hauteurCase = 0
  
  local function actionCase( event )
    if elementCourant == nil then
      print("Aucun élément sélectionné !")
    elseif event.target.element ~= nil then
      print("Il y a déjà un élément ici !")
    else
      print("Placement de "..elementCourant)
      local x = event.target.x
      local y = event.target.y
      local scenegroup = event.target.scenegroup
      scenegroup:remove(event.target)
      event.target = display.newImage("images/terrain_plein.png")
      event.target.anchorX = 0
      event.target.anchorY = 1
      event.target.x = x
      event.target.y = y
      event.target:addEventListener("tap", actionCase)
      event.target.scenegroup = scenegroup
      event.target.element = elementCourant
      scenegroup:insert(event.target)
      elementCourant = nil
      energieActuelle = energieActuelle - 1
      lblEnergie.text.text = tostring(energieActuelle)..'/'..tostring(energieMax)
    end
  end
  
  for j = 1, 4 do
    for k = 1, 4 do
      local case = display.newImage("images/terrain.png")
      case.anchorX = 0
      case.anchorY = 1
      case.x = X
      case.y = Y
      case.element = nil
      case.scenegroup = pScenegroup
      case:addEventListener("tap", actionCase)
      hauteurCase = case.height
      X = X + hauteurCase + 10
      pScenegroup:insert(case)
    end
    X = pX + 5
    Y = Y - hauteurCase - 10
  end
  
  return terrain
end

function scene:create( event )
	local sceneGroup = self.view
  
  local fond = display.newImageRect("images/fond_base.png", 1280, 720)
  fond.anchorX = 0
  fond.anchorY = 0
  sceneGroup:insert(fond)

  lblEnergie = GUI.newLabel(display.actualContentWidth - 15, 15, tostring(energieActuelle)..'/'..tostring(energieMax), "images/energie.png", 30)
  lblArgent = GUI.newLabel(display.actualContentWidth - 15, 30 + lblEnergie.background.height, tostring(argent)..'$', "images/argent.png", 30)
  lblJour = GUI.newLabel(display.actualContentWidth - 15, 45 + 2*lblEnergie.background.height, "Jour : 0", "images/jour.png", 30)


  local function actionBoutonLegumes()
    print("TODO : Ouverture de la liste des légumes à planter")
    composer.gotoScene("scenelegumes")
  end
  
  local function actionBoutonStock()
    print("TODO : Ouverture du stock de légumes")
  end
  
  local function actionBoutonBatiments()
    print("TODO : Affichage de la liste des bâtiments")
  end
  
  local function actionBoutonAnimaux()
    print("TODO : Affichage de la liste des animaux")
  end
  
  local function actionBoutonContrats()
    print("TODO : Affichage de la liste des contrats disponibles")
  end
  
  local function actionBoutonDepenses()
    print("TODO : Affichage de la liste des dépenses")
  end
  
  local posX = 15
  local posY = display.actualContentHeight - 15
  local btnLegumes = GUI.newButton(posX, posY, "Légumes", "images/bouton_bas.png", 25, actionBoutonLegumes)
  posX = posX + btnLegumes.width + 15
  local btnStock = GUI.newButton(posX, posY, "Stock", "images/bouton_bas.png", 25, actionBoutonStock)
  posX = posX + btnLegumes.width + 15
  local btnBatiments = GUI.newButton(posX, posY, "Bâtiments", "images/bouton_bas.png", 25, actionBoutonBatiments)
  posX = posX + btnLegumes.width + 15
  local btnAnimaux = GUI.newButton(posX, posY, "Animaux", "images/bouton_bas.png", 25, actionBoutonAnimaux)
  posX = posX + btnLegumes.width + 15
  local btnContrats = GUI.newButton(posX, posY, "Contrats", "images/bouton_bas.png", 25, actionBoutonContrats)
  posX = posX + btnLegumes.width + 15
  local btnDepenses = GUI.newButton(posX, posY, "Dépenses", "images/bouton_bas.png", 25, actionBoutonDepenses)
  
  posX = 15
  posY = display.actualContentHeight - 15 - btnLegumes.height - 15
  
  largeurTerrain = 0
  for i = 1, 3 do
    for j = 1, 5 do
      local terrain = ajouterTerrain(posX, posY, sceneGroup)
      posX = posX + terrain.width + 15
      largeurTerrain = terrain.width
    end
    posX = 15
    posY = posY - largeurTerrain - 15
  end
  
  sceneGroup:insert(lblEnergie.background)
  sceneGroup:insert(lblEnergie.text)
  sceneGroup:insert(lblArgent.background)
  sceneGroup:insert(lblArgent.text)
  sceneGroup:insert(lblJour.background)
  sceneGroup:insert(lblJour.text)
  sceneGroup:insert(btnLegumes)
  sceneGroup:insert(btnStock)
  sceneGroup:insert(btnBatiments)
  sceneGroup:insert(btnAnimaux)
  sceneGroup:insert(btnContrats)
  sceneGroup:insert(btnDepenses)
  
  
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Exécuté avant que la scène ne vienne à l'écran
	elseif phase == "did" then
		-- Exécuté une fois que la scène est à l'écran
    lblArgent.text.text = tostring(argent)..'$'
    print(elementCourant)
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