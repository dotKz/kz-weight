# kz-weight



### Add new metadata  
- <strong>Add this to qbr-core/server/player.lua (~ line 486)</strong></br>
```PlayerData.metadata['metaweight'] = PlayerData.metadata['metaweight'] or 50```  
  

### Change consumable script in qbr-smallresources/client/consumables.lua  
- <strong>In :</strong> ```RegisterNetEvent("consumables:client:Eat", function(itemName)``` <br><br>
<strong>//Replace :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", exports['qbr-core']:GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])```<br><br>
<strong>//With :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", exports['qbr-core']:GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].hunger)```<br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesEat[itemName].metaweight)```<br><br>

- <strong>In :</strong> ```RegisterNetEvent("consumables:client:DrinkAlcohol", function(itemName))```<br><br>
<strong>//Replace :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])```<br><br>
<strong>//With :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName].thirst)```<br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesAlcohol[itemName].metaweight)```<br><br>

- <strong>In :</strong> ```RegisterNetEvent("consumables:client:DrinkEat", function(itemName)```<br><br>
<strong>//Replace :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])```<br><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", exports['qbr-core']:GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])```<br>
<strong>//With :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName].thirst)```<br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", exports['qbr-core']:GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].hunger)```<br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesEat[itemName].metaweight)```<br><br>

- <strong>In :</strong> ```RegisterNetEvent("consumables:client:Drink", function(itemName)```<br><br>
<strong>//Replace :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])```<br><br>
<strong>//With :</strong><br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName].thirst)```<br>
```TriggerServerEvent("QBCore:Server:SetMetaData", "metaweight", exports['qbr-core']:GetPlayerData().metadata["metaweight"] + ConsumeablesDrink[itemName].metaweight)```<br>  
  



### Change item value in qbr-smallresources/config.lua (example)  
```
ConsumeablesEat = {
    ["sandwich"] 				    = {hunger = math.random(15, 25), 	metaweight = 0.2},
    ["apple"] 					    = {hunger = math.random(5, 10), 	metaweight = 0.03},
    ["cannedbeans"] 			  = {hunger = math.random(20, 35), 	metaweight = 0.2},
	  ["bread"] 					    = {hunger = math.random(10, 20), 	metaweight = 0.2},
	  ["chocolate"] 				  = {hunger = math.random(5, 10), 	metaweight = 0.2},
}

ConsumeablesDrink = {
    ["water_bottle"] 			  = {thirst = math.random(35, 54), 	metaweight = 0.2},
    ["coffee"] 					    = {thirst = math.random(40, 50), 	metaweight = 0.2},
}

ConsumeablesAlcohol = {
    ["whiskey"] 	= {thirst = math.random(20, 30), 	metaweight = 0.2},
    ["beer"] 		  = {thirst = math.random(30, 40), 	metaweight = 0.2},
    ["rhum"] 		  = {thirst = math.random(20, 40), 	metaweight = 0.2},
}  
```
