extends Node

class_name Attacks

var Attacks_data = {
	"Spell Attack":{
		"range" : 'range',
		"type" : 'magic',
		"aim": true,
		"delay": 1.0,
		"wait_time": 2.0,
		"scene": 'res://src/scripts/SpellScene.gd'
	},
}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func summon_attack(attack : String, actor: Node2D):
	pass
