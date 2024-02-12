---@meta AssetBundle

---The AssetBundle behavior is present on Objects that were created from a custom [AssetBundle](https://kb.tabletopsimulator.com/custom-content/custom-assetbundle/).
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/assetbundle/)
---@class AssetBundle
local AssetBundle = {}

---Return the index of the currently looping effect. Indexes starts at 0.
---@return int
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/behavior/assetbundle/#getloopingeffectindex)
---
function AssetBundle.getLoopingEffectIndex() end

---Returns a Table with the keys "index" and "name" for each looping effect.
---@return {index: int, name: int}[]
---
---***
---
---### Example Usage
---```
---effectTable = self.AssetBundle.getLoopingEffects()
---
----- Example returned table
---{
---    {index=0, name="Effect Name 1"},
---    {index=1, name="Effect Name 2"},
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/assetbundle/#getloopingeffects)
---
function AssetBundle.getLoopingEffects() end


---Returns a Table with the keys "index" and "name" for each trigger effect.
---@return {index: int, name: int}[]
---
---***
---
---### Example Usage
---```
---effectTable = self.AssetBundle.getTriggerEffects()
----- Example returned table
---{
---    {index=0, name="Effect Name 1"},
---    {index=1, name="Effect Name 2"},
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/assetbundle/#getTriggerEffects)
---
function AssetBundle.getTriggerEffects() end

---Starts playing a looping effect. Indexes start at 0.
---@param index int
---@return nil
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/behavior/assetbundle/#playloopingeffect]
---
function AssetBundle.playLoopingEffect(index) end

---Starts playing a trigger effect. Indexes start at 0.
---@param index int
---@return nil
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/behavior/assetbundle/#playtriggereffect]
---
function AssetBundle.playTriggerEffect(index) end
