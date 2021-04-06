extends Node


# Declare member variables here. Examples:
# var a = 2
onready var body = get_parent()
var walk_movement = Vector2()
var dash_direction = Vector2()
var aim_vector = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	walk_movement = Vector2(Input.get_action_strength("axis_x_right") - Input.get_action_strength("axis_x_left"),
			Input.get_action_strength("axis_y_down") - Input.get_action_strength("axis_y_up"))
			
	aim_vector = Vector2(Input.get_action_strength("axis_aim_right") - Input.get_action_strength("axis_aim_left"),
			Input.get_action_strength("axis_aim_down") - Input.get_action_strength("axis_aim_up"))
			
	if(Input.get_last_mouse_speed().length() > 10):
		aim_vector = (get_tree().current_scene.get_global_mouse_position() - body.position).normalized() 
#		print(aim_vector)
#	print(walk_movement)
	
#	if Input.is_action_just_pressed("fire") or Input.is_action_pressed("ui_accept"):
#		var new_spell = preload("res://src/scenes/Spell.tscn").instance()
#		new_spell.direction = get_parent().get_node("Aim").aim_direction.normalized() * 300
#		new_spell.position = get_parent().get_node("Aim/Sprite").global_position
#		get_tree().current_scene.add_child(new_spell)
		
	if Input.is_action_pressed("ui_cancel"):
		var new_spell = preload("res://src/scenes/SpellSimple.tscn").instance()
		new_spell.direction = get_parent().get_node("Aim").aim_direction.normalized() * 300
		new_spell.position = get_parent().get_node("Aim/Sprite").global_position
		get_tree().current_scene.add_child(new_spell)	
		
	if Input.is_action_just_pressed("ui_cancel"):
		dash_direction = get_parent().get_node("Aim").aim_direction.normalized()

func _input(event):
	var input = event as InputEvent
	var mouse_motion = event as InputEventMouseMotion
	
	if input:
		if input.is_action_pressed("fire"):
			var new_spell = preload("res://src/scenes/Spell.tscn").instance()
			new_spell.direction = get_parent().get_node("Aim").aim.direction.normalized() * 300
			new_spell.position = get_parent().get_node("Aim/Sprite").global_position
			get_tree().current_scene.add_child(new_spell)
	
#	if mouse_motion:
#		aim_vector = (get_tree().current_scene.get_global_mouse_position() - body.position).normalized() 
#		print(mouse_motion)
#		aim_vector = (mouse_motion.speed).normalized() 
	pass
