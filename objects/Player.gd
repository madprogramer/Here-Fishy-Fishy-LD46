extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Initial
var startX = 80
var startY = 270

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
		FoodMove(delta)
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
	move_and_collide(Vector2(0, speed*cos(t/T)))
	t+=delta
	
	#print(t, " ", T, sin(t/T))
	
func FoodMove(delta):
	
	#Target the left-most
	
	var X = 999999
	var Y = 999999
	
	for child in .get_parent().get_tree().get_nodes_in_group("Food"):
		if X > child.global_position.x and child.global_position.x > self.global_position.x:
			X = child.global_position.x
			Y = child.global_position.y
		#print(X, " ", Y)
	#print(X, " ", Y)
	#print("DONE")
	if X == 999999 and Y ==999999:
		noFoodMove(delta)
	else:
		#TAKE ARCTAN
		#TAKE COS OF ARCTAN
		
		#print(Y," ",global_position.y)
		var moveY = sign( (Y - (global_position.y)) )
		#var moveY = ( sin( atan((global_position.y-Y )/(global_position.x-X)) ))
		#print(sin(-atan((global_position.y-Y )/(global_position.x-X))))
		#print(moveY*speed)
		move_and_collide(Vector2(0, moveY*speed))
		#disp+=moveY*speed


		
# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_position(Vector2(startX,startY))
	pass # Replace with function body.

func _physics_process(delta):
	seekFood(delta)
	#print(disp)
	#print(self.get_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Hitbox_body_entered(body) -> void:
	if body.is_in_group("Food"):
		#print("FOOD")
		body.queue_free()
	elif body.is_in_group("Enemy"):
		.get_parent().screenShake()
		.get_parent().State = "GameOver"
		.get_parent().get_node("Control/Score").visible = false
		.get_parent().get_node("Control/GameOver").visible = true
		for FISH in .get_parent().get_tree().get_nodes_in_group("Enemy"):
			FISH.queue_free()
		for FOOD in .get_parent().get_tree().get_nodes_in_group("Food"):
			FOOD.queue_free()
		queue_free()
	pass # Replace with function body.

