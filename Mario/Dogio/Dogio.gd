extends KinematicBody2D

onready var sprite = get_node("Sprite")

var vel = Vector2()
var run_speed = 150

var facing = 1 setget _set_facing

func _ready():
	set_fixed_process( true )


func _fixed_process( delta ):
	var LEFT = Input.is_action_pressed( "LEFT" )
	var RIGHT = Input.is_action_pressed( "RIGHT" )
	var new_facing = facing
	vel.x = (RIGHT - LEFT) * run_speed * delta
	

	var motion = move( vel )
	
	if LEFT or RIGHT:
		new_facing = sign( vel.x )
	
	if new_facing != self.facing:
		self.facing = new_facing



func _set_facing( what ):
	facing = what
	sprite.set_scale( Vector2( facing, 1 ) )


