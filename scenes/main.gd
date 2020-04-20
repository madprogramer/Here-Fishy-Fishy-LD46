extends Node

onready var ENEMY = preload("res://objects/Enemy.tscn")

var State = "Gameplay"
#Tutorial
#Gameplay
#GameOver

var Part = 1
var SCORE = 0
var NEXTIN = 4
var REM = 0

func reset():
	SCORE = 0
	NEXTIN = 4
	REM = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func advancePart():
	Part+=1

func screenShake():
	$CanvasLayer/ColorRect/AnimationPlayer.play("Back and Forth")
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
				reset()
		elif Part == 5 : pass
	elif State == "Gameplay":
		$Control/Score/RichTextLabel4.text = "Score: %s"%(floor(SCORE*100))
		
		SCORE+=delta
		
		REM+=delta
		#print(REM," ",NEXTIN)
		if REM >= NEXTIN:
			var e = ENEMY.instance()
			self.add_child(e)
			REM = 0
			NEXTIN = max(NEXTIN-0.02,2)
		
	elif State == "GameOver":
		$Control/GameOver/FinalScore.text = "Final Score: %s"%(floor(SCORE*100))
	

