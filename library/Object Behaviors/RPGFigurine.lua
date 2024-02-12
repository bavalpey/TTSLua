---@meta RPGFigurine


---The RPGFigurine behavior is present on Objects that are figurines with built-in animations (i.e. RPG Kit objects).
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/rpgfigurine/)
---@class RPGFigurine
local RPGFigurine = {}

---Callback executed when an attack is performed by the RPGFigurine Object.
---
---An attack is triggered via the context menu or by pressing the appropriate number key. If another RPGFigurine is
---within its attack arc, then [onHit](https://api.tabletopsimulator.com/behavior/rpgfigurine/#onhit) will be executed
---on the other figurine.
---@param hitObjects Object[] A table of RPGFigurine Objects within reach of the attack
---
---***
---### Example Usage
---Assign an `onAttack` callback that prints the name of each object attacked.
---
---```
---function object.RPGFigurine.onAttack(hitObjects)
---    for _, v in ipairs(hitObjects) do
---        print(v.getName() .. " was hit!")
---    end
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/rpgfigurine/#onattack)
function RPGFigurine.onAttack(hitObjects) end

---Executed when the RPGFigurine Object is hit by another attacking RPGFigurine Object.
---
---An attack is triggered via the context menu or by pressing the appropriate number key. If this RPGFigurine Object is
---within the attack radius of an attacker, this function will be executed.
---@param attacker Object The attacking RPGFigurine Object
---
---***
---### Example Usage
---Assign an `onHit` callback that prints the name of the object that performed the attack.
---```
---function object.RPGFigurine.onHit(attacker)
---    print(attacker.getName() .. " attacked the Cyclops!")
---end
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/rpgfigurine/#onhit)
function RPGFigurine.onHit(attacker) end

---Plays a random attack animation
---@return bool
---
---***
---
---### Example Usage
---Make an RPG figurine attack.
---```
---object.RPGFigurine.attack()
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/rpgfigurine/#attack)
---
function RPGFigurine.attack() end

---Changes the figurine's current mode. What the mode represents is based on the figurine.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/rpgfigurine/#changemode)
function RPGFigurine.changeMode() end

---Plays the death animator or causes it to return to life.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/rpgfigurine/#die)
function RPGFigurine.die() end
