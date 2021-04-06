extends Node

export(String, FILE) var base_room_file;
var base_room;
var base_room_instance;
onready var parent = get_parent();

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	base_room = preload("res://src/scenes/base_room.tscn")
	base_room_instance = base_room.instance()
	add_child(base_room_instance,true)
	base_room_instance.position = Vector2(0,0)
#	print(base_room_instance.position)
	
	$RoomController.place_doors()

	# print('done')
	# print(parent.get_children())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
