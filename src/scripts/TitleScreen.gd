extends Control

var ws = WebSocketClient.new()
var URL = "wss://godot-server.lufemas.repl.co:3000/"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_JoinButton_button_down():
	var err = ws.connect_to_url(URL)
	if err != OK:
		print('connection refused')
		
	print(err)
	pass # Replace with function body.



func _on_HostButton_button_down():
	ws.disconnect_from_host()
	pass # Replace with function body.
