extends KinematicBody2D

onready var animator = get_node("Animator")

onready var ray_left = get_node("RayLeft")
onready var ray_right = get_node("RayRight")

var run_speed = -32

func squish():
	animator.play("squish")
	set_fixed_process(false)
	clear_shapes()

func die():
	queue_free()




func start():
	set_pos( get_pos() + Vector2(8,8) )
	set_fixed_process(true)
	animator.play("run")

func _ready():
	ray_right.add_exception_rid( get_rid() )
	ray_left.add_exception_rid( get_rid() )

func _fixed_process(delta):
	var force = Vector2( run_speed, Game.GRAVITY )
	
	var motion = move( force * delta )
	if is_colliding():
		var n = get_collision_normal()
		var x = rad2deg( acos( n.dot( Vector2(1,0) ) ) )
#		if ( rad2deg(acos(n.dot( Vector2(1,0)))) < 35 ):
#			print("hit right wall")
#			run_speed = -32
#		elif ( rad2deg(acos(n.dot( Vector2(-1,0)))) < 35 ):
#			print("hit left wall")
#			run_speed = 32
		if ray_right.is_colliding():
			run_speed = -32
		elif ray_left.is_colliding():
			run_speed = 32
		motion = n.slide(motion)
		move(motion)
	
	var y = get_pos().y
	if y > 240:
		queue_free()

func _on_Hitbox_body_enter( body ):
	if body.is_in_group("player"):
		var ydiff = (get_pos().y - 8) - (body.get_pos().y + 8)
		if ydiff > 0:
			body.sfx.play("squish")
			squish()


func _on_Vis_enter_screen():
	if !is_fixed_processing():
		start()
