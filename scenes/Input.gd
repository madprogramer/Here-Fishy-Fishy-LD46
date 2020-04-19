extends Control

onready var pellet = preload("res://objects/Food.tscn")

func _input(event):
	if event.is_action_pressed('click'):
		print( Vector2(get_global_mouse_position().x,-16) )
		var p = pellet.instance()
		p.set_position(Vector2(get_global_mouse_position().x,-16))
		.get_parent().add_child(p)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
