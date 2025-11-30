extends Node2D

#To have something listen for the got_item signal:
#1. Have the listener in the same tree as an item
#2. Select the item. On the left hand side, click the node tab and click got_item twice
#3. Double click the desired listener on the list of nodes
#4. Change the generated function to do what you want in reponse to the signal
func _ready () -> void:
	SignalManager.got_item.connect(_on_got_item) #executes on got item when signal is received

func _on_got_item(item_name: String) -> void:
	print("Got " + item_name)
