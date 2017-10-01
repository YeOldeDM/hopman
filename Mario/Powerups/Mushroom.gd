extends KinematicBody2D

func pickup( who ):
	who.make_big()
	queue_free()


func _on_Hitbox_body_enter( body ):
	if body.is_in_group("player"):
		pickup(body)