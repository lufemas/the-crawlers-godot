extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var direction: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
#	applied_force = direction
	apply_central_impulse(direction)
	randomize()
	var randomScale = rand_range(.3, .7)
	var randomHue = rand_range(0, 359)
	$Sprite.scale = Vector2(randomScale, randomScale)
	$Sprite.modulate.h = randomHue
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	position += direction*delta
	pass




