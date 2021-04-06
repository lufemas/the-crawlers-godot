extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100;
onready var body = get_parent()
onready var playerController = get_node('../PlayerController')


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func walk():
	return body.move_and_slide(playerController.walk_movement * speed, Vector2.UP)
	
