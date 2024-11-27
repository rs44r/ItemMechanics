extends MarginContainer
class_name PlayerInventory

@export_category("Inventory Size")
@export var n_rows : int =5
@export var n_columns : int =8

@onready var inventory_grid : InventoryGrid = $GridContainer

var positions_used : Array[bool]

func _ready():
	inventory_grid.n_columns=n_columns
	inventory_grid.n_rows=n_rows

func add_item(item:GenericItem):
	inventory_grid.add_item(item,Vector2(0,0))
	
func remove_item(item:GenericItem):
	inventory_grid.remove_item(item)
