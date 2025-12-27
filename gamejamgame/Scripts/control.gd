extends Control
@onready var panel: Panel = $Panel
@onready var rich_text_label: RichTextLabel = $Panel/RichTextLabel

func _ready() -> void:
	panel.visible = false
	SignalManager.alert.connect(_on_alert)

func _on_alert(): 
	panel.visible = true
