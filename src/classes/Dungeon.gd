extends Node

class_name Dungeon

var directions = ['U','R','D','L']
var rooms = []


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

	pass # Replace with function body.

func generate_room(must_have_door):
	doors.append(must_have_door)
	doors.append(generate_door())
	
	print(doors)
	
func generate_door():
	var random = randi() % 4
	if doors.has(directions[random]):
		return generate_door()
	return directions[random]	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
