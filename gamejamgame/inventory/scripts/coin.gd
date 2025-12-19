# test commit

extends Area2D

@export var item: InvItem
@export var amount := 1

func _on_body_entered(body):
	if body.has_method("add_item"):
		body.add_item(item, amount)
		queue_free()
