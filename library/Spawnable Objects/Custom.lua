---@meta Custom

---# Custom
---You can spawn [custom Objects](https://kb.tabletopsimulator.com/custom-content/about-custom-objects/)
-- and then provide the custom content for them after spawning them by calling
---[setCustomObject()](https://api.tabletopsimulator.com/object/#setcustomobject).
---
---You can also use setCustomObject along with [reload()](https://api.tabletopsimulator.com/object/#reload) to modify an
---existing custom Object.
---### ⚠️ This class and its subclasses are abstract classes
---They do not really exist in Tabletop Simulator's Lua API. They are just interfaces to help with the
---[setCustomObject()](https://api.tabletopsimulator.com/object/#setcustomobject)
---and [getCustomObject()](https://api.tabletopsimulator.com/object/#getcustomobject) functions.
---@see Object.setCustomObject
---@class CustomObject


---# Custom AssetBundle

---@alias assetBundleType
---| 0 # Generic
---| 1 # Figurine
---| 2 # Dice
---| 3 # Coin
---| 4 # Board
---| 5 # Chip
---| 6 # Bag
---| 7 # Infinite bag

---@alias assetBundleMaterial
---| 0 # Plastic
---| 1 # Wood
---| 2 # Metal
---| 3 # Cardboard


---Properties for the Custom AssetBundle object.
---@class CustomObject.Properties.CustomAssetbundle
---@field assetbundle string the path/URL for the AssetBundle.
---@field type assetBundleType An Int representing the Object's type.
---@field material assetBundleMaterial An Int representing the Object's material.


---Parameters for creating/editing a Custom AssetBundle object.
---@class CustomObject.Params.CustomAssetbundle
---@field assetbundle string the path/URL for the AssetBundle.
---@field type? assetBundleType An Int representing the Object's type. *Optional, defaults to 0 (Generic)*
---@field material? assetBundleMaterial An Int representing the Object's material. *Optional, defaults to 0 (Plastic)*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-assetbundle)

---# Custom Board

---Properties for the Custom Board object.
---@class CustomObject.Properties.CustomBoard
---@field image string The path/URL for the board.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-board)

---@class CustomObject.Params.CustomBoard
---@field image string The path/URL for the board.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-board)

---# Custom Card

---@alias cardShape
---| 0 # Rectangle (Rounded)
---| 1 # Rectangle
---| 2 # Hex (Rounded)
---| 3 # Hex
---| 4 # Circle

---Properties for the Custom Card object.
---@class (exact) CustomObject.Properties.CustomCard
---@field type cardShape The card Shape.
---@field face string The path/URL of the face image.
---@field back string The path/URL of the back image.
---@field sideways bool If the card is horzontal, instead of vertical.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-card)

---Parameters for creating/editing a Custom Card object.
---@class CustomObject.Params.CustomCard
---@field type? cardShape The card Shape. *Optional, defaults to 0 (Rectangle (Rounded))*
---@field face string The path/URL of the face image.
---@field back string The path/URL of the back image.
---@field sideways? bool If the card is horzontal, instead of vertical. *Optional, defaults to false*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-card)

---# Custom Deck

---Properties for the Custom Deck object.
---@class (exact) CustomObject.Properties.CustomDeck
---@field face string The path/URL of the face cardsheet.
---@field back string The path/URL of the back cardsheet or card back.
---@field unique_back bool If each card has a unique card back (via a cardsheet).
---@field width int The number of columns on the cardsheet.
---@field height int The number of rows on the cardsheet.
---@field number int the number of cards on the cardsheet.
---@field sideways bool Whether the cards are horizontal, instead of vertical.
---Whether the card back should be used as the hidden image (instead of the last slot of the `face` image).
---@field back_is_hidden bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-deck)

---Parameters for creating/editing a Custom Deck object.
---@class CustomObject.Params.CustomDeck
---@field face string The path/URL of the face cardsheet.
---@field back string The path/URL of the back cardsheet or card back.
---@field unique_back? bool If each card has a unique card back (via a cardsheet). *Optional, defaults to false*
---@field width? int The number of columns on the cardsheet. *Optional, defaults to 10*
---@field height? int The number of rows on the cardsheet. *Optional, defaults to 7*
---@field number? int the number of cards on the cardsheet. *Optional, defaults to 52*
---@field sideways? bool Whether the cards are horizontal, instead of vertical. *Optional, defaults to false*
---Whether the card back should be used as the hidden image (instead of the last slot of the `face` image).
---*Optional, defaults to false*
---@field back_is_hidden? bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-deck)

---# Custom Dice

---@alias customDiceSides
---| 0 # 4-sided
---| 1 # 6-sided
---| 2 # 8-sided
---| 3 # 10-sided
---| 4 # 12-sided
---| 5 # 20-sided

---Properties for the Custom Dice object.
---@class (exact) CustomObject.Properties.CustomDice
---@field image string The path/URL for the [custom die](https://kb.tabletopsimulator.com/custom-content/custom-dice/).
---@field type customDiceSides The type of die, which determines its number of sides.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-dice)

---Parameters for creating/editing a Custom Dice object.
---@class CustomObject.Params.CustomDice
---@field image string The path/URL for the [custom die](https://kb.tabletopsimulator.com/custom-content/custom-dice/).
---The type of die, which determines its number of sides. *Optional, defaults to 1 (6-sided)*
---@field type? customDiceSides
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-dice)

---# Custom Figurine

---Properties for the Custom Figurine object.
---@class (exact) CustomObject.Properties.CustomFigurine
---@field image string The path/URL for the [custom figurine](https://kb.tabletopsimulator.com/custom-content/custom-figurine/).
---@field image_secondary string The path/URL for the custom figurine's back.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-figurine)

---Parameters for creating/editing a Custom Figurine object.
---@class CustomObject.Params.CustomFigurine
---The path/URL for the [custom figurine](https://kb.tabletopsimulator.com/custom-content/custom-figurine/).
---@field image string
---@field image_secondary? string The path/URL for the custom figurine's back. *Optional, defaults to "image"*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-figurine)

---# Custom Model

---Properties for the Custom Model object.
---@class (exact) CustomObject.Properties.CustomModel
---The path/URL for the .obj mesh used on the
---[custom model](https://kb.tabletopsimulator.com/custom-content/custom-model/).
---@field mesh string
---@field diffuse string the path/URL for the diffuse image.
---@field normal string the path/URL for the normals image.
---@field convex bool Whether the object model is convex.
---@field type assetBundleType An Int representing the Object's type.
---@field material assetBundleMaterial An Int representing the Object's material.
---@field specular_intensity float The specular intensity.
---The specular [Color](https://api.tabletopsimulator.com/types/#color).
---@field specular_color Color
---@field freshnel_strength float The freshnel strength.
---@field cast_shadows bool Whether the Object casts shadows.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-model)

---Parameters for creating/editing a Custom Model object.
---@class CustomObject.Params.CustomModel
---The path/URL for the .obj mesh used on the
---[custom model](https://kb.tabletopsimulator.com/custom-content/custom-model/).
---@field mesh string
---@field diffuse string the path/URL for the diffuse image.
---@field normal? string the path/URL for the normals image. *Optional, not used by default*
---@field convex? bool Whether the object model is convex. *Optional, defaults to false*
---@field type? assetBundleType An Int representing the Object's type. *Optional, defaults to 0 (Generic)*
---@field material? assetBundleMaterial An Int representing the Object's material. *Optional, defaults to 0 (Plastic)*
---@field specular_intensity? float The specular intensity. *Optional, defaults to 0.1*
---The specular [Color](https://api.tabletopsimulator.com/types/#color). *Optional, defaults to {r=1, g=1, b=1}*
---@field specular_color? Color
---@field freshnel_strength? float The freshnel strength. *Optional, defaults to 0.1*
---@field cast_shadows? bool Whether the Object casts shadows. *Optional, defaults to true*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-model)

---# Custom Tile

---@alias customTileShape
---| 0 # Square/Rectangle
---| 1 # Hex
---| 2 # Circle

---Properties for the Custom Tile object.
---@class (exact) CustomObject.Properties.CustomTile
---The path/URL for the [custom tile](https://kb.tabletopsimulator.com/custom-content/custom-tile/) image.
---@field image string
---@field type customTileShape The tile Shape.
---@field image_bottom string The path/URL for the bottom-side image.
---@field stackable bool Whether these tiles stack together into a pile.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-tile)

---Parameters for creating/editing a Custom Tile object.
---@class CustomObject.Params.CustomTile
---The path/URL for the [custom tile](https://kb.tabletopsimulator.com/custom-content/custom-tile/) image.
---@field image string
---@field type? customTileShape The tile Shape. *Optional, defaults to 0 (Square/Rectangle)*
---@field image_bottom? string The path/URL for the bottom-side image. *Optional, uses the top image by default*
---@field stackable? bool Whether these tiles stack together into a pile. *Optional, defaults to false*

---# Custom Token

---Properties for the Custom Token object.
---@class (exact) CustomObject.Properties.CustomToken
---The path/URL for the [custom token](https://kb.tabletopsimulator.com/custom-content/custom-token/) image.
---@field image string
---@field merge_distance float How accurately the token shape will trace image edge (in pixels).
---@field stackable bool Whether these tokens stack together into a pile.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-token)

---Parameters for creating/editing a Custom Token object.
---@class CustomObject.Params.CustomToken
---The path/URL for the [custom token](https://kb.tabletopsimulator.com/custom-content/custom-token/) image.
---@field image string
---How accurately the token shape will trace image edge (in pixels). *Optional, defaults to 15*
---@field merge_distance float
---@field stackable bool Whether these tokens stack together into a pile. *Optional, defaults to false*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/custom-game-objects/#custom-token)

---@alias CustomObject.ParamsKind CustomObject.Params.CustomAssetbundle
---| CustomObject.Params.CustomBoard
---| CustomObject.Params.CustomCard
---| CustomObject.Params.CustomDeck
---| CustomObject.Params.CustomDice
---| CustomObject.Params.CustomFigurine
---| CustomObject.Params.CustomModel
---| CustomObject.Params.CustomTile
---| CustomObject.Params.CustomToken


---@alias CustomObject.PropertiesKind CustomObject.Properties.CustomAssetbundle
---| CustomObject.Properties.CustomBoard
---| CustomObject.Properties.CustomCard
---| CustomObject.Properties.CustomDeck
---| CustomObject.Properties.CustomDice
---| CustomObject.Properties.CustomFigurine
---| CustomObject.Properties.CustomModel
---| CustomObject.Properties.CustomTile
---| CustomObject.Properties.CustomToken
