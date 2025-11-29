extends Area2D

@onready var icon: Sprite2D = $Icon #Reference variable to our clicker icon

#When the item is hovered over, the click icon will appear. When it leaves, it will disappear.
func _on_mouse_entered() -> void:
	icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false
