extends Area2D
@onready var icon: Sprite2D = $Icon
@export var pre_text: String #Text before and after prereqs are met
@export var post_text: String
@export var prereq: String
var prereq_met = false

func _ready(): 
	if(prereq == "key" and DataManager.has_key == true):
		prereq_met = true
	elif(prereq == "mushrooms" and DataManager.has_mushrooms == true):
		prereq_met = true
	elif(prereq == "timer" and DataManager.has_timer == true):
		prereq_met = true

func _on_mouse_entered() -> void:
	icon.visible = true

func _on_mouse_exited() -> void:
	icon.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("LeftMouseClick")):
		if (prereq_met):
			SignalManager.display_text.emit(post_text)
			if(prereq == "key"):
				get_tree().change_scene_to_file("res://Scenes/win.tscn")
			queue_free()
		else:
			SignalManager.display_text.emit(pre_text)
