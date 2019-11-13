extends RigidBody2D

export var maxspeed = 300
onready var TileSound = get_node("/root/World/Sound3")
onready var WallSound = get_node("/root/World/Sound2")
onready var BallSprite = get_node("/root/World/Ball/CanvasItem/Modulate")

signal lives
signal score

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var WorldNode = get_node("/root/World")
 connect("score", WorldNode, "increase_score")
 connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tiles"):
   emit_signal("score",body.score)
   body.queue_free()
   TileSound.play()
  if body.get_name() == "Paddle":
   WallSound.play()
  else:
   WallSound.play()
  pass
  
 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()