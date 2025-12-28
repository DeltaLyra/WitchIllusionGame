extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer # ref so we can play animation
@onready var color_rect: ColorRect = $ColorRect

func _ready():
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
#Manages the changing of levels. Id have the name make more sense except i dont want to test how strict itch will be
func transition(level_num): 
	if(level_num != 0 and level_num != 6):
			animation_player.play("Leave")
			await animation_player.animation_finished # waits until animation is done so we don't have to use timers :pray:
			match level_num:
				1:
					get_tree().change_scene_to_file("res://Scenes/cage_room.tscn")
				2:
					get_tree().change_scene_to_file("res://Scenes/potion_room.tscn")
				3:
					get_tree().change_scene_to_file("res://Scenes/book_room.tscn")
				4:
					get_tree().change_scene_to_file("res://Scenes/kitchen.tscn")
				5: 
					get_tree().change_scene_to_file("res://Scenes/door_room.tscn")
				_:
					print("Cry")
			await get_tree().process_frame # wait a frame, just to give it time to load
			animation_player.play("Arrive")
func gameOver():
	animation_player.play("Leave")
	
