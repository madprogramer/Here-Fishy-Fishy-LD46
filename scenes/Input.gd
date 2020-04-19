extends Control

onready var pellet = preload("res://objects/Food.tscn")


func getState():
	return .get_parent().State
func getPart():
	return .get_parent().Part
	
func advancePart():
	return .get_parent().advancePart()
	
func clickToSpawnPellet(event):
	#print( Vector2(get_global_mouse_position().x,-16) )
	var p = pellet.instance()
	p.set_position(Vector2(get_global_mouse_position().x,-16))
	.get_parent().add_child(p)
		
func _input(event):
	if event.is_action_pressed('click'):
		if getState() == "Tutorial":
			if getPart() == 1:
				$Tutorial1.visible=false
				$Tutorial2.visible=true
				advancePart()
			elif getPart() == 2:
				$Tutorial2.visible=false
				$Tutorial3.visible=true
				advancePart()
			elif getPart() == 5:
				$Tutorial5.visible=false
				$Score.visible=true
				advancePart()
			else:
				clickToSpawnPellet(event)
		elif getState() == "Gameplay":
			clickToSpawnPellet(event)
			

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
