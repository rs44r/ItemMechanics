extends Control
class_name InventoryGrid

@export_category("Grid Size")
@export var n_rows : int =1
@export var n_columns : int =1



var item_scene = preload("res://GenericItem.tscn")
var item_list : Array[Node]
var item_positions : Array[Vector2]

func _ready():
	var num_children = n_rows*n_columns
	$GridContainer.columns = n_columns
	
	$ItemArea.custom_minimum_size=Vector2(43*n_columns,43*n_rows)
	
	for n in range(num_children):
		var new_child : Panel = Panel.new()
		new_child.custom_minimum_size=Vector2(42,42)
		$GridContainer.add_child(new_child)
					
func place_at(item : GenericItem, item_position : Vector2):
	$ItemArea.add_child(item)
	item.position=item_position
	
func remove_first_item():
	var item : GenericItem = item_list.front()
	remove_item(item)

func remove_item(item : GenericItem):
	$ItemArea.remove_child(item)
	item_positions.remove_at(item_list.find(item))
	item_list.erase(item)

func add_item(item:GenericItem, item_position:Vector2):
	item_list.append(item)
	item_positions.append(item_position)
	place_at(item, item_position)


	
		
		
