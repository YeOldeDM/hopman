extends Node2D

onready var respawn = get_node("RESPAWN")

var player


func respawn_player():
	if player:
		player.set_pos( respawn.get_pos() )
		player.dead = false
		player.set_fixed_process(true)


func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("RESPAWN"):
		respawn_player()