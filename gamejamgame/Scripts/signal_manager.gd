extends Node
#This is a global script that handles signals such as when an item is picked up and when an alert object is interacted with
#Using this makes managing signals easierbecuase we don't need to worry about directly connecting receivers and emitters, especially when some objects are mmade during run time
signal got_item(item: InvItem)
signal alert()
