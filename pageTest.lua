largeur = display.actualContentWidth
hauteur = display.actualContentHeight

posX = 15
posY = hauteur - 15


function ajouterBouton(pX, pY)
  local bouton = display.newImage("images/bouton_bas.png")
  bouton.anchorX = 0
  bouton.anchorY = 1
  bouton.x = pX
  bouton.y = pY
  return bouton
end

function ajouterTerrain(pX, pY)
  local terrain = display.newImage("images/terrain_fond.png")
  terrain.anchorX = 0
  terrain.anchorY = 1
  terrain.x = pX
  terrain.y = pY
  
  local X = pX + 5
  local Y = pY - 5
  local hauteurCase = 0
  
  for j = 1, 4 do
    for k = 1, 4 do
      local case = display.newImage("images/terrain.png")
      case.anchorX = 0
      case.anchorY = 1
      case.x = X
      case.y = Y
      hauteurCase = case.height
      X = X + hauteurCase + 10
    end
    X = pX + 5
    Y = Y - hauteurCase - 10
  end
  
  return terrain
end

function ajouterContrat(pX, pY)
  local contrat = display.newImage("images/contrat.png")
  contrat.anchorX = 1
  contrat.anchorY = 1
  contrat.x = pX
  contrat.y = pY
  return contrat
end

hauteurBouton = 0
for i = 1, 7 do
  local bouton = ajouterBouton(posX, posY)
  posX = posX + bouton.width + 15
  hauteurBouton = bouton.height
end

posX = 15
posY = posY - hauteurBouton - 15
hauteurTerrain = 0

for i = 1, 5 do
  local terrain = ajouterTerrain(posX, posY)
  posX = posX + terrain.width + 15
  hauteurTerrain = terrain.height
end

posX = 15
posY = posY - hauteurTerrain - 15


for i = 1, 5 do
  local terrain = ajouterTerrain(posX, posY)
  posX = posX + terrain.width + 15
end

posX = 15
posY = posY - hauteurTerrain - 15


for i = 1, 5 do
  local terrain = ajouterTerrain(posX, posY)
  posX = posX + terrain.width + 15
end

energie = display.newImage("images/energie.png")
energie.anchorX = 1
energie.anchorY = 0
energie.y = display.actualContentHeight - 15 - hauteurBouton - 3 * (hauteurTerrain + 15)
energie.x = display.actualContentWidth - 15

argent = display.newImage("images/argent.png")
argent.anchorX = 1
argent.anchorY = 0

argent.y = energie.y + energie.height + 15
argent.x = display.actualContentWidth - 15

jour = display.newImage("images/jour.png")
jour.anchorX = 1
jour.anchorY = 0
jour.y = argent.y + argent.height + 15
jour.x = display.actualContentWidth - 15

posX = display.actualContentWidth - 15
posY = display.actualContentHeight - hauteurBouton - 30

for i = 1, 3 do
  local contrat = ajouterContrat(posX, posY)
  posY = posY - contrat.height - 15
end