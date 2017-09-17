extends StaticBody2D

onready var animator = get_node("Animator")

export(bool) var bricks = false
export(bool) var dispenser = false

func break_bricks():
	if self.bricks and !dispenser:
		var gibs = preload("res://Blocks/BrickGibs.tscn").instance()
		get_parent().add_child(gibs)
		gibs.set_pos( get_pos() )
		gibs.set_emitting(true)
		queue_free()
		
	if self.dispenser:
		animator.play("bump")

func _ready():
	animator.connect("finished", self, "_on_animator_finished")
	

func _on_animator_finished():
	if self.dispenser:
		var cell = get_parent().world_to_map( get_pos() )
		get_parent().set_cellv( cell, 6 )
		queue_free()



