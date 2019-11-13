extends KinematicBody2D

var new_ball = preload("res://Scenes/Ball.tscn")
onready var Background = get_node("/root/World/Sound")
var _endpoint = position

func _ready():
 set_process_input(true)
 position.y = 25
 $Tween.interpolate_property(self, "position", position, _endpoint, 1.2, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
 $Tween.start()

func _physics_process(delta):
 var mouse_x = get_viewport().get_mouse_position().x
 position = Vector2(mouse_x, position.y)

func _input(event):
 if event is InputEventMouseButton and event.pressed:
  if not get_parent().has_node("Ball"):
   var ball = new_ball.instance()
   ball.position = position - Vector2(0, 32)
   ball.name = "Ball"
   ball.linear_velocity = Vector2(200, -200)
   get_parent().add_child(ball)