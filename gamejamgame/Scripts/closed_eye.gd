extends Sprite2D


func _ready() -> void:
	SignalManager.alert.connect(_on_alert)


func _on_alert():
	texture = preload("uid://bqtcscg4natpl")
