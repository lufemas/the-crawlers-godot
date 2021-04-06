extends Node


# Declare member variables here. Examples:
# var a = 2
var room = Room.new()


# Called when the node enters the scene tree for the first time.
func place_doors():
	room.generate_room(false)
	room.generate_room(false)
#	print(room.doors)
	for pos in room.doors:
		var new_door = preload("res://src/scenes/Door.tscn").instance()
		get_parent().add_child(new_door)
		new_door.position = get_parent().base_room_instance.get_node('DoorPositions').get_node(pos).position
#		print(new_door.position)
		new_door.get_node("Sprites").get_node(pos).visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
