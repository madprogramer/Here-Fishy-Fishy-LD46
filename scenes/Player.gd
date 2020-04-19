extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Initial
var startX = 100
var startY = 300

#Motion Rules
#var disp = 0
#var limits = 100
var speed = 1
var t = 0
var T = 0.125*3.14
#var upIf
#var P

func seekFood(delta):
	if (.get_parent().get_tree().get_nodes_in_group("Food")).size() != 0 :
		t = 0
		FoodMove()
	else:
		noFoodMove(delta)

func noFoodMove(delta):
	#Compute probability to go up
	"""
	P = (limits + disp)/(2.0*limits) 
	upIf = P*100
	#print(upIf, " ",disp)
	#Gravitate to center the further you go
	if abs(upIf-50) <= 10:
		pass
	elif randi()%100+1 <= upIf:
		move_and_collide(Vector2(0, -1*speed))
		disp-=1
	else:
		move_and_collide(Vector2(0, 1*speed))
		disp+=1
	"""
	
	#move_and_collide(Vector2(0, -1*speed))
	
	#Sinusoidal Motion
	move_and_collide(Vector2(0, -speed*sin(t/T)))
	t+=delta
	
func FoodMove():
	
	#Target the left-most
	
	var X = 999999
	var Y = 999999
	
	for child in .get_parent().get_tree().get_nodes_in_group("Food"):
		if X > child.global_position.x:
			X = child.global_position.x
			Y = child.global_position.y
		#print(X, " ", Y)
	#print(X, " ", Y)
	#print("DONE")
	
	#TAKE ARCTAN
	#TAKE COS OF ARCTAN
	
	#print(Y," ",global_position.y)
	#var moveY = sign(Y-global_position.y)
	var moveY = ( sin( atan((global_position.y-Y )/(global_position.x-X)) ))
	#print(sin(-atan((global_position.y-Y )/(global_position.x-X))))
	#print(moveY*speed)
	move_and_collide(Vector2(0, moveY*speed))
	#disp+=moveY*speed

# Called when the node enters the scene tree for the first time.
func _ready():
	#self.set_position(Vector2(startX,startY))
	pass # Replace with function body.

func _physics_process(delta):
	seekFood(delta)
	#print(disp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Hitbox_body_entered(body) -> void:
	if (body.is_in_group("Food")):
		print("HEYO")
	pass # Replace with function body.
