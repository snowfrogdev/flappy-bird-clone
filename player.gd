extends CharacterBody2D

@export var FLAP_STRENGTH: float = -300.0

signal player_collided()

func _physics_process(delta: float) -> void:
  if not is_on_floor():
    velocity += get_gravity() * delta
  
  if Input.is_action_just_pressed("Flap Wings"):
    velocity.y = FLAP_STRENGTH
  
  var collision := move_and_collide(velocity * delta)

  if collision:
    player_collided.emit()
