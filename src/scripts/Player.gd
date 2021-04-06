extends KinematicBody2D

enum states {
	IDLE,
	WALK,
	ATTACK,
	HURT
}

onready var aim = $Aim.aim

export var state = states.IDLE

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(aim.sprite.global_position)
	$AnimationControler.walk_animation($Movement.walk())
	pass
