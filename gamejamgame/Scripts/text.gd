extends Control
@onready var panel: Panel = $Panel
@onready var rich_text_label: RichTextLabel = $Panel/RichTextLabel
@onready var timer: Timer = $Timer

func _ready() -> void:
	panel.visible = false
	SignalManager.display_text.connect(_on_display_text)

func _on_display_text(text): 
	panel.visible = true
	rich_text_label.text = text
	timer.start()
	
func _on_timer_timeout() -> void:
	timer.stop()
	print("Timer done!!")
	panel.visible = false
