extends KinematicBody2D

var vel = Vector2()
var run_speed = 150



func _ready():
	set_fixed_process( true )


func _fixed_process( delta ):
	var LEFT = Input.is_action_pressed( "LEFT" )
	var RIGHT = Input.is_action_pressed( "RIGHT" )
	
	vel.x = (RIGHT - LEFT) * run_speed * delta
	
	var motion = move( vel )
	