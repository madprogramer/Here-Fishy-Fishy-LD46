extends Node2D
class_name Food 

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	self.queue_free()
