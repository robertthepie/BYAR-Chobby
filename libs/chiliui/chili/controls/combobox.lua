--// =============================================================================

--- ComboBox module

--- ComboBox fields.
-- Inherits from Control.
-- @see control.Control
-- @table ComboBox
-- @tparam {"item1", "item2", ...} items table of items in the ComboBox, (default {"items"})
-- @int[opt = 1] selected id of the selected item
-- @tparam {func1, func2, ...} OnSelect listener functions for selected item changes, (default {})
-- @tparam {string1, string2, ...} itemImages table of image paths/files for items
ComboBox = Button:Inherit{
	classname = "combobox",
	caption = 'combobox',
	defaultWidth  = 70,
	defaultHeight = 20,
	items = { "items" },
	itemsTooltips = {},
	itemImages = {},
	itemHeight = 20,
	selected = 1,
	showSelection = true,
	OnOpen = {},
	OnClose = {},
	OnSelect = {},
	OnSelectName = {},
	selectionOffsetX = 0,
	selectionOffsetY = 0,
	maxDropDownHeight = 200,
	minDropDownHeight = 50,
	maxDropDownWidth = 500,
	minDropDownWidth = 50,
	topHeight = 7,
	noFont = false,
	preferComboUp = false
}

local ComboBoxWindow      = Window:Inherit{classname = "combobox_window", resizable = false, draggable = false, }
local ComboBoxScrollPanel = ScrollPanel:Inherit{classname = "combobox_scrollpanel", horizontalScrollbar = false, }
local ComboBoxStackPanel  = StackPanel:Inherit{classname = "combobox_stackpanel", autosize = true, resizeItems = false, borderThickness = 0, padding = {0, 0, 0, 0}, itemPadding = {0, 0, 0, 0}, itemMargin = {0, 0, 0, 0}, }
local ComboBoxItem        = Button:Inherit{classname = "combobox_item"}

local this = ComboBox
local inherited = this.inherited

function ComboBox:New(obj)
	obj = inherited.New(self, obj)
	obj:Select(obj.selected or 1)
	return obj
end

--- Selects an item by id
-- @int itemIdx id of the item to be selected
function ComboBox:Select(itemIdx)
	if (type(itemIdx) == "number") then
		local item = self.items[itemIdx]
		if not item then
			return
		end
		self.selected = itemIdx

		if type(item) == "string" and not self.ignoreItemCaption then
			self.caption = ""
			self.caption = item
		end
		self:CallListeners(self.OnSelect, itemIdx, true)
		self:Invalidate()
	elseif (type(itemIdx) == "string") then
		self:CallListeners(self.OnSelectName, itemIdx, true)
		for i = 1, #self.items do
			if self.items[i] == itemIdx then
				self:Select(i)
			end
		end
	end
end

function ComboBox:_CloseWindow()
	self.labels = nil
	if self._dropDownWindow then
		self:CallListeners(self.OnClose)
		if self._dropDownWindow then
			self._dropDownWindow:Dispose()
			self._dropDownWindow = nil
		end
	end
	if (self.state.pressed) then
		self.state.pressed = false
		self:Invalidate()
		return self
	end
end

function ComboBox:FocusUpdate()
	if not self.state.focused then
		if self.labels then
			for i = 1, #self.labels do
				if self.labels[i].state.pressed then
					return
				end
			end
		end
		self:_CloseWindow()
	end
end

function ComboBox:MouseDown(x, y)
	self.state.pressed = true
	if not self._dropDownWindow then
		local sx, sy = self:LocalToScreen(0, 0)

		local selectByName = self.selectByName
		local labels = {}

		local width = math.max(self.width, self.minDropDownWidth)
		local height = self.topHeight

		local imageWidth = self.itemHeight * 0.85
		local imageHeight = self.itemHeight * 0.85
		local imagePadding = (self.itemHeight - imageHeight) / 3

		for i = 1, #self.items do
			local item = self.items[i]
			if type(item) == "string" then
				local itemContainer = StackPanel:New {
					width = '100%',
					height = self.itemHeight,
					orientation = 'vertical',
					padding = {imagePadding, imagePadding, imagePadding, imagePadding},
					itemMargin = {0, 0, 0, 0},
					autosize = false,
					resizeItems = false,
					centerItems = false,
				}

				if self.itemImages[i] then
					local imageControl = Image:New {
						width = imageWidth,
						height = imageHeight,
						file = self.itemImages[i],
						keepAspect = true,
						y = (self.itemHeight - imageHeight) * 0.5,
					}
					itemContainer:AddChild(imageControl)
				end

				local newBtn = ComboBoxItem:New {
					caption = item,
					width = '100%',
					height = self.itemHeight,
					padding = {3, 0, 3, 0},
					fontsize = self.itemFontSize,
					objectOverrideFont = self.objectOverrideFont,
					state = {focused = (self.showSelection and i == self.selected), selected = (self.showSelection and i == self.selected)},
					children = { itemContainer },
					OnMouseUp = {
						function()
							if selectByName then
								self:Select(item)
							else
								self:Select(i)
							end
							self:_CloseWindow()
						end
					}
				}

				if self.itemsTooltips[i] then
					newBtn.tooltip = self.itemsTooltips[i]
				end

				labels[#labels + 1] = newBtn
				height = height + self.itemHeight
				width = math.max(width, self.font:GetTextWidth(item) + 
					(self.itemImages[i] and (imageWidth + imagePadding + 6) or 0))
			else
				labels[#labels + 1] = item
				item.OnMouseUp = { function()
						self:Select(i)
						self:_CloseWindow()
				end }
				width = math.max(width, item.width + 5)
				height = height + item.height -- FIXME: what if this height is relative?
			end
		end

		self.labels = labels

		height = math.max(self.minDropDownHeight, height)
		height = math.min(self.maxDropDownHeight, height)
		width = math.min(self.maxDropDownWidth, width)

		local screen = self:FindParent("screen")
		local y = sy + self.height
		if self.preferComboUp or y + height > screen.height then
			y = sy - height
		end

		self._dropDownWindow = ComboBoxWindow:New{
			parent = screen,
			width  = width,
			height = height,
			minHeight = self.minDropDownHeight,
			x = math.max(sx, math.min(sx + self.width - width, (sx + x - width/2))) + self.selectionOffsetX,
			y = y + self.selectionOffsetY,
			children = {
				ComboBoxScrollPanel:New{
					width  = "100%",
					height = "100%",
					children = {
						ComboBoxStackPanel:New{
							width = '100%',
							children = labels,
						},
					},
				}
			}
		}
		self:CallListeners(self.OnOpen)
	else
		self:_CloseWindow()
	end

	self:Invalidate()
	return self
end

function ComboBox:MouseUp(...)
	self:Invalidate()
	return self
	-- this exists to override Button:MouseUp so it doesn't modify .state.pressed
end
