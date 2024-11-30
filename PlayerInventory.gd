extends MarginContainer
class_name PlayerInventory

@export_category("Inventory Size")
@export var n_rows : int
@export var n_columns : int

@onready var inventory_grid : InventoryGrid = $GridContainer

var positions_used : Array[bool]

func _ready():
	inventory_grid.n_columns=n_columns
	inventory_grid.n_rows=n_rows
	inventory_grid._ready()
	
	for i in range(n_columns*n_rows):
		positions_used.append(false)
	
func find_free_position(item:GenericItem)->int:
	var i_k=0
	for index in range(positions_used.size()):
		i_k=index
		if positions_used[index]==true:
			continue
		else:
				if index%n_columns+item.item_data.size_x-1>n_columns-1:
					break
				if floori(index/n_columns)+item.item_data.size_y-1>n_rows-1:
					break
				
				var found:bool=true
				for i_x in range(item.item_data.size_x):
						for i_y in range(item.item_data.size_y):
							if positions_used[index+i_x+n_columns*i_y]==true:
								found=false
								break
				if found:
					return index
					
	print("cannot carry, no space left")
		
	return -1


				
func flag_used(item:GenericItem,position_index:int):
	for i_x in range(item.item_data.size_x):
		for i_y in range(item.item_data.size_y):
				positions_used[position_index+i_x+n_columns*i_y]=true
	for i in range(n_rows):
		print(positions_used.slice(i*n_columns,(i+1)*n_columns))

func flag_free(item:GenericItem,position_index:int):
	for i_x in range(item.item_data.size_x):
		for i_y in range(item.item_data.size_y):
				positions_used[position_index+i_x+n_columns*i_y]=false		
		
func add_item(item:GenericItem):
	var position_index=find_free_position(item)
	if position_index==-1:
		print("cannot carry, no space left")
	else:
		var position=Vector2(position_index%n_columns,floori(position_index/n_columns))
		print("position:",position_index,position)
		flag_used(item,position_index)
		inventory_grid.add_item(item,position*43)
	
func remove_item(item:GenericItem):
	flag_free(item,0)
	inventory_grid.remove_item(item)
