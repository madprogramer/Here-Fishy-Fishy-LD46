extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.set_position( Vector2(get_viewport_rect().size.x+100, rand_range(100,get_viewport_rect().size.y-100) ))
	#print (get_position())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
func _physics_process(delta):
	move_and_collide(Vector2(-1.5,0))

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
