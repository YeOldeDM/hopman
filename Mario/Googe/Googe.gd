extends KinematicBody2D

onready var sfx = get_node("SFX")



func squish():
	var corpse = preload("res://Googe/DeadGooge.tscn").instance()
	get_parent().add_child(corpse)
	var pos = get_pos()
	pos.y += 8
	corpse.set_pos(pos)
	queue_free()




func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Hitbox_body_enter( body ):
	if body.is_in_group("player"):
		var ydiff = (get_pos().y - 8) - (body.get_pos().y + 8)
		if ydiff > 0:
			body.sfx.play("squish")
			squish()
