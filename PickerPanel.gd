extends Container

@export var item_array : Array[ItemData]
@onready var inventory : InventoryGrid = $MarginContainer/VBoxContainer/InventoryGrid
@onready var item_label : Label = $MarginContainer/VBoxContainer/ItemLabel

var current_item : GenericItem
signal item_picked(item:GenericItem)

func generate_new():
	var new_item_data = item_array.pick_random()
	var new_item = ItemGenerator.new().createItem(new_item_data)
	inventory.add_item(new_item,Vector2(0,0))
	item_label.text=new_item_data.item_name
	current_item = new_item

func _ready():
	generate_new()
	
func _on_refresh_button_up():
	inventory.remove_item(current_item)
	generate_new()

func _on_pick_button_up():
	inventory.remove_item(current_item)
	item_picked.emit(current_item)
	generate_new()
