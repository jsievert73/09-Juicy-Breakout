extends Area2D

onready var Background = get_node("/root/Game/Sound")
func _physics_process(delta):
	Background.play()
	
	pass