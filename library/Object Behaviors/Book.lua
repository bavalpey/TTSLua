---@meta Book

---The Book behavior is present on Custom PDF Objects. The Book behaviour allows you to manipulate the displayed PDF.
---@class Book
---The page numbers displayed in the Custom PDF UI are offset by this amount.
--->### Info
---> For example, if `page_offset` were set to 10, the first page in the UI would be 11, rather than 1. Negative numbers are accepted, and useful if a rule book contains a front cover, index etc. within the PDF file.
---@field page_offset int
local Book = {}

---Clears the current highlight.
---@return bool
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/book/#clearhighlight)
---
function Book.clearHighlight() end

---Gets the current page of the PDF
---
---@param offsetPageNumbering bool Indicates whether or not [page offset](https://api.tabletopsimulator.com/behavior/book/#page_offset) should be applied to the page number returned. *Optional, defaults to `false`.*
---@return int # The current page of the PDF.
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/book/#getpage)
---
function Book.getPage(offsetPageNumbering) end

---Draws a highlight rectangle on the popout mode of the PDF at the given coordinates. Coordinates \(0,0\) are the lower
---left corner of the PDF, while coordinates \(1,1\) are the upper right corner.
---
---@param x1 float x coordinate of the rectangle's left side.
---@param x2 float x coordinate of the rectangle's right side.
---@param y1 float y coordinate of the rectangle's left side.
---@param y2 float y coordinate of the rectangle's right side.
---@return bool
---
---***
---
---### Example Usage
---Highlight the upper right quarter of a PDF.
---```
---object.Book.setHighlight(0.5, 0.5, 1, 1)
---```
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/book/#sethighlight)
---
function Book.setHighlight(x1, x2, y1, y2) end


---Sets the current page of the PDF. Returns true if the page was succesfully set, false if the page number was invalid.
---
---@param page int The new page number.
---@param offsetPageNumbering bool Indicates whether or not [page_offset](https://api.tabletopsimulator.com/behavior/book/#page_offset) should be applied to the page number set. *Optional, defaults to `false`.*
---
---***
---
---[Open Documentation](https://api.tabletopsimulator.com/behavior/book/#setpage)
---
function Book.setPage(page, offsetPageNumbering) end
