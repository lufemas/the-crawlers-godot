extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var attacks = Attacks.new()
var players: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	players.append(get_tree().current_scene.get_node("Player"))
	
	for player in players:
		player.connect("summon_attack",self,"summon_attack")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func handle_network_message(message):
	if message.actionName:
		summon_attack_from_net(message.args.attackName,message.direction,message.position)
		
#		"player":"lufemas",
#		"actionName": actionName,
#		"args" : args,
#		"direction": body.aim.direction,
#		"position" : body.aim.sprite.position

func summon_attack_from_net(attackName : String, dir, pos) -> void:
	print('sumonning...')
	var new_attack = attacks.data[attackName].scene.instance()
	new_attack.direction = str_to_vec2(dir).normalized() * 300
	new_attack.position = str_to_vec2(pos)
	get_tree().current_scene.add_child(new_attack)
	print(new_attack.direction)
	print(new_attack.position)
	print('sumonned.')
	pass

func summon_attack(attackName : String, actor: Node2D) -> void:
	var new_attack = attacks.data[attackName].scene.instance()
	new_attack.direction = actor.aim.direction.normalized() * 300
	new_attack.position = actor.aim.sprite.global_position
	actor.get_tree().current_scene.add_child(new_attack)
	pass

func str_to_vec2(strVec):
	#cords = "(1324, 1654)"
	strVec.erase(strVec.find("("),1)
	strVec.erase(strVec.find(")"),1)
	strVec.erase(strVec.find(","),1)
	var x = strVec.left(strVec.find(" "))
	var y = strVec.right(strVec.find(" "))
	strVec = Vector2(x,y)
	return strVec
