# qb-methdelivery

# A simple meth delivery job for qbcore

Discord - https://discord.gg/XPuqBVtyqX


## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 31/05/2022.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu


## Credits : 

- BerkieB for his qb-target.
- BrownyLad for the idea


## Insert into @qb-core/shared/items.lua 

```
QBShared.Items = {
-- meth delivery
['cash-roll'] 			 	     = {['name'] = 'cash-roll', 		    	  	['label'] = 'Cash Roll', 		    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'cash-roll.png', 	    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A large roll of cash.'},
	['meth-large'] 			 	     = {['name'] = 'meth-large', 			     	['label'] = 'Large Meth Bag', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'meth-large.png', 	    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A large bag of meth.'},

}

```

## Insert Contents of @qb-methdelivery/images into @qb-inventory/HTML/Images


## Insert into @qb-target - init.lua - config.targetmodels
["methdeliveryped"] = {
		models = {
			"s_m_y_ammucity_01"
		},
		options = {
			{
				type = "client",
				event = "qb-menu:DeliveryJob",
				icon = "fas fa-pill",
				label = "Meth Head",
			}
		},
		distance = 2.5,
	}, 
  
