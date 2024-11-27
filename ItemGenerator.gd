extends Object
class_name  ItemGenerator

var generic_item_scene=preload("res://GenericItem.tscn")

func createItem(item_data:ItemData) -> GenericItem: 
	var item : GenericItem = generic_item_scene.instantiate()
	item.item_data=item_data
	return item
	
