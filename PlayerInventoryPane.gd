extends PanelContainer

@onready var inventory = $MarginContainer3/VBoxContainer/Inventory

func add_item(item:GenericItem):
	inventory.add_item(item)
	
func remove_item(item:GenericItem):
	inventory.remove_item(item)

func _on_item_picked(item:GenericItem):
	add_item(item)
