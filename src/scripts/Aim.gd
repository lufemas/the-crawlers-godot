extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var aim = {
	"sprite": $Sprite,
	"direction": Vector2()
}
#var aim_direction = Vector2()
onready var playerController = get_node('../PlayerController')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(playerController.aim_vector.length() > .4):
		aim["direction"] = playerController.aim_vector
		rotation = aim["direction"].angle()
	pass
