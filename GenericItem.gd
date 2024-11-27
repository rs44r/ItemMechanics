extends Control
class_name  GenericItem

@export var item_data : ItemData 


func _ready():
	custom_minimum_size=Vector2(item_data.size_x*42+(item_data.size_x-1),item_data.size_y*42+(item_data.size_y-1))

func _on_button_up():
		print("clicked item")
