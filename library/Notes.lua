---@meta Notes

---# Notes

---Notes, a static global class, allows access to the on-screen notes and the notebook.
---
---[Open Documentation](https://api.tabletopsimulator.com/notes/)
---@class Notes
Notes = {}

---Parameters for `addNotebookTab`.
---@class Notebooktab.Parameters.Add
---@field title string Title for the new tab
---@field body? string Text to place into the body of the new tab. *Optional, defaults to an empty string*
---[Player Color](https://api.tabletopsimulator.com/player/instance/) for the new tab's color. *Optional, defaults to
---Grey*
---@field color? PlayerColor

---Parameters for `editNotebookTab`.
---@class Notebooktab.Parameters.Edit
---@field index int Index number of the tab to edit.
---@field title? string New title for the tab.
---@field body? string New text for the tab.
---@field color? PlayerColor The [Player Color](https://api.tabletopsimulator.com/player/instance/) the tab should belong to.

---@class NotebookTab.Properties
---@field index int The 0-based index of the tab.
---@field title string The title of the tab.
---@field body string The text of the tab.
---@field color PlayerColor The [Player Color](https://api.tabletopsimulator.com/player/instance/) that the tab belongs to.

---Adds a notebook tab, returning its index.
---
---@param parameters Notebooktab.Parameters.Add
---@return int # The index of created tab to be used with `editNotebookTab` and `removeNotebookTab`. Indexes begin at 0.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/notes/#addnotebooktab)
---
function Notes.addNotebookTab(parameters) end

---Edit an existing Tab in the notebook. Indexes for notebook tabs begin at 0.
---
---@param parameters Notebooktab.Parameters.Edit
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/notes/#editnotebooktab)
---
function Notes.editNotebookTab(parameters) end

---Returns a Table containing data on all tabs in the notebook. Indexes for notebook tabs begin at 0.
---@return NotebookTab.Properties[]
---
---***
---
---### Example Usage
---```
---tabInfo = Notes.getNotebookTabs()
---
------Example Returned Table
---{
---    {index=0, title="", body="", color="Grey"},
---    {index=1, title="", body="", color="Grey"},
---    {index=2, title="", body="", color="Grey"},
---}
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/notes/#getnotebooktabs)
---
function Notes.getNotebookTabs() end

---Remove a notebook tab. Notebook tab indexes begin at 0.
---
---@param index int Index for the tab to remove
---@return bool
function Notes.removeNotebookTab(index) end

---Returns the contents of the on-screen notes section.
---@return string
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/notes/#getnotes)
function Notes.getNotes() end

---Replace the text in the notes window with the string.
---@param notes string
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/notes/#setnotes)
---
function Notes.setNotes(notes) end

return Notes
