extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var detectedFood = false

#Motion Rules
var disp = 0
var limits = 100
var speed = 0.25
var upIf
var P

func noFoodMove():
	#Compute probability to go up
	P = (limits - disp)/(2.0*limits) 
	upIf = P*100
	print(upIf, " ",disp)
	#Gravitate to center the further you go
	if abs(upIf-50) <= 10:
		pass
	elif randi()%100+1 <= upIf:
		move_and_collide(Vector2(0, -1*speed))
		disp+=1
	else:
		move_and_collide(Vector2(0, 1*speed))
		disp-=1
		


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if not detectedFood:
		noFoodMove()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
