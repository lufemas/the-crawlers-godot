extends Node

export var isServer = true
export var SERVER_PORT = 5000;
export var MAX_PLAYERS = 3
export var SERVER_IP = '0.0.0.0'

var peer = NetworkedMultiplayerENet.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	if isServer:
		initServer()
	else:
		initClient()	

func initServer():
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
	pass

func initClient():
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().network_peer = peer
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(get_tree().get_network_connected_peers())
	pass
