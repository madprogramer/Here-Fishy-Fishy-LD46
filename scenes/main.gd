extends Node

var State = "Gameplay"
#Tutorial
#Gameplay
#GameOver

var Part = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func advancePart():
	Part+=1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if State == "Tutorial":
		if Part == 1 : pass
		elif Part == 2 : pass
		elif Part == 3 :
			if $Player.get_position().y <= 129:
				Part = 4
				$Control/Tutorial3.visible = false
				$Control/Tutorial4.visible = true
		elif Part == 4 : 
			if $Player.get_position().y >= 400:
				Part = 5
				$Control/Tutorial4.visible = false
				$Control/Tutorial5.visible = true
		elif Part == 5 : pass
	elif State == "Gameplay":
		print("Should Totally Keep A Score")
	

