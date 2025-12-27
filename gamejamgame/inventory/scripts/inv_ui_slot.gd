extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display

func update(slot):
	if slot.item == null:
		item_visual.texture = null
		return

	item_visual.texture = slot.item.texture
