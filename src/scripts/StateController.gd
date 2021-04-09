extends Node


export var current = 'IDLE'
onready var body = get_parent()

signal summon_attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func call_action(actionName:String, args = {}):
#	if actionName == 'attack':
#		emit_signal("summon_attack", args.attackName, body)
#		GM.summon_attack(args.attackName, body)
	Network.sendMessage({
		"player":"lufemas",
		"actionName": actionName,
		"args" : args,
		"direction": body.aim.direction,
		"position" : body.aim.sprite.global_position})
#		call_action_on_server("summon_attack", args.attackName, id)
