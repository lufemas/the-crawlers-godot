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
	if playerController.walk_movement == Vector2.ZERO:
		$AnimationPlayer.play("stop")	
		return
		
#	if playerController.walk_movement != Vector2.ZERO:
#		$AnimationPlayer.play("walk", -1, playerController.walk_movement.length()*2.5 )	
#		return
		
	pass
	
func walk_animation(mov_vec:Vector2):
	$AnimationPlayer.play("walk", -1, playerController.walk_movement.length()*2.5 )	
	return
		
