extends CharacterBody2D
#Used godot's template for player movement, edited so player can only move left and right.

const SPEED = 400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D #Making a reference variable so we can change the sprite based on inputs/player direction

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# Changed action keybinds, can use arrow keys or A and D.
	if (DataManager.can_move):
		var direction = Input.get_axis("MoveLeft", "MoveRight")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite_2d.play("Idle")
		#If direction is 1, we're moving right and we want the sprite to flip. If it's -1. we're moving left and we want to make sure the sprite is facing left.
		if direction == 1:
			animated_sprite_2d.flip_h = false
		elif direction == -1:
			animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("Walk")
	move_and_slide()

#connected through node tab
func _on_next_level_body_entered(body: Node2D) -> void:
	if(!DataManager.is_alert):
		print((get_parent().level_num) + 1)
		Fade.transition((get_parent().level_num) + 1)


func _on_prev_level_body_entered(body: Node2D) -> void:
	if(!DataManager.is_alert):
		print((get_parent().level_num) -1)
		Fade.transition((get_parent().level_num) - 1)
