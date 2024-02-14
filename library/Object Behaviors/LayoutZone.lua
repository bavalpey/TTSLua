---@meta LayoutZone

---@class LayoutZoneOptionsSetter
---@field alternate_direction? bool Objects added to a group will be aligned up or right, different from the preceding object in the group. Used, for example, in trick-taking games to make counting easier.
---@field cards_per_deck? int Sets the size of decks made by the layout zone when it combines newly added cards.
---@field combine_into_decks? bool Whether cards added to the zone should be combined into decks. You may specify the number of cards per deck.
---@field direction? int The directions the groups in the zone expand into. This will determine the origin corner.
---@field horizonta_group_padding? float How much horizontal space is inserted between groups.
---@field horizontal_spread? float How far each object in a group is moved horizontally from the previous object.
---@field instant_refill? bool When enabled, if ever a group is picked up or removed the rest of the layout will trigger to fill in the gap
---@field manual_only? bool The zone will not automatically lay out objects: it must be triggered manually.
---@field max_objects_per_group? int Each group in the zone may not contain more than this number of objects.
---@field max_objects_per_new_group? int When new objects are added to a zone, they will be gathered into groups of this many objects.
---@field meld_direction? int The direction the objects within a group will expand into.
---@field meld_reverse_sort? bool When enabled the sort order inside a group is reversed
---@field meld_sort? int How groups are sorted internally.
---@field meld_sort_existing? bool When enabled all groups will be sorted when laid out, rather than only newly added groups.
---@field new_object_facing? int Determines whether newly added objects are turned face-up or face-down.
---@field randomize? bool Objects will be randomized whenever they are laid out
---@field split_added_decks? bool Decks added to the zone will be split into their individual cards.
---@field sticky_cards? bool When picked up, cards above the grabbed card will also be lifted.
---@field trigger_for_face_down? bool Face-Down objects dropped on zone will be laid out.
---@field trigger_for_face_up? bool Face-Up objects dropped on zone will be laid out.
---@field trigger_for_non_cards? bool Non-card objects dropped on zone will be laid out
---@field vertical_group_padding? float How much vertical space is inserted between groups.
---@field vertical_spread? float How far each object in a group is moved vertically from the previous object.

---# Options
---Layout zone option tables may contain the following properties
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/layoutzone/#options)
---
---@class (exact) LayoutZoneOptions
---@field allow_swapping bool When moving an object from one full group to another, the object you drop on will be moved to the original group.
---@field alternate_direction bool Objects added to a group will be aligned up or right, different from the preceding object in the group. Used, for example, in trick-taking games to make counting easier.
---@field cards_per_deck int Sets the size of decks made by the layout zone when it combines newly added cards.
---@field combine_into_decks bool Whether cards added to the zone should be combined into decks. You may specify the number of cards per deck.
---@field direction int The directions the groups in the zone expand into. This will determine the origin corner.
---@field horizonta_group_padding float How much horizontal space is inserted between groups.
---@field horizontal_spread float How far each object in a group is moved horizontally from the previous object.
---@field instant_refill bool When enabled, if ever a group is picked up or removed the rest of the layout will trigger to fill in the gap
---@field manual_only bool The zone will not automatically lay out objects: it must be triggered manually.
---@field max_objects_per_group int Each group in the zone may not contain more than this number of objects.
---@field max_objects_per_new_group int When new objects are added to a zone, they will be gathered into groups of this many objects.
---@field meld_direction int The direction the objects within a group will expand into.
---@field meld_reverse_sort bool When enabled the sort order inside a group is reversed
---@field meld_sort int How groups are sorted internally.
---@field meld_sort_existing bool When enabled all groups will be sorted when laid out, rather than only newly added groups.
---@field new_object_facing int Determines whether newly added objects are turned face-up or face-down.
---@field randomize bool Objects will be randomized whenever they are laid out
---@field split_added_decks bool Decks added to the zone will be split into their individual cards.
---@field sticky_cards bool When picked up, cards above the grabbed card will also be lifted.
---@field trigger_for_face_down bool Face-Down objects dropped on zone will be laid out.
---@field trigger_for_face_up bool Face-Up objects dropped on zone will be laid out.
---@field trigger_for_non_cards bool Non-card objects dropped on zone will be laid out
---@field vertical_group_padding float How much vertical space is inserted between groups.
---@field vertical_spread float How far each object in a group is moved vertically from the previous object.

---# LayoutZone
---The LayoutZone behavior is present on [Layout Zones](https://kb.tabletopsimulator.com/game-tools/zone-tools/#layout-zone).
---#### Example
---Log a layout zone's options.
---```
---log(zone.LayoutZone.getOptions())
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/layoutzone/)
---@class LayoutZone
local LayoutZone = {}

---Returns the layout zone's [options](https://api.tabletopsimulator.com/behavior/layoutzone/#options).
---@return LayoutZoneOptions
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/behavior/layoutzone/#getoptions)
---
function LayoutZone.getOptions() end

---Causes the layout zone to (re)layout.
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/behavior/layoutzone/#layout)
---
function LayoutZone.layout() end

---Sets the layout zone's [options](https://api.tabletopsimulator.com/behavior/layoutzone/#options). If an option is not included in the table, then the zone's value for that option will remain unchanged.
---@param options LayoutZoneOptionsSetter
---@return bool
---
---***
---[Open Documentation](https://api.tabletopsimulator.com/behavior/layoutzone/#setoptions)
---
function LayoutZone.setOptions(options) end
