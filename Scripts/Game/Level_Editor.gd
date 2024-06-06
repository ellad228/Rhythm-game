extends Node2D
class_name  Level_Editor

var array : Array = [[]]
var counter : int = 0
@export var circle : PackedScene

func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_button_left"):
		array[counter] = [0,0]
		var pos_x : int = get_global_mouse_position().x
		var pos_y : int = get_global_mouse_position().y
		
		var instance = circle.instantiate()
		add_child(instance)
		
		instance.position.x = pos_x
		instance.position.y = pos_y
		array[counter][0] = pos_x
		array[counter][1] = pos_y
		add_child(instance)
		
		counter += 1
		array.resize(counter + 1)
		
		print(array)
		print(array.size())
		if get_child_count() == 6:
			for i in get_children():
				i.queue_free()
