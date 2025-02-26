extends CharacterBody2D

@export var FLAP_STRENGTH: float = -300.0

func _physics_process(delta: float) -> void:
  if not is_on_floor():
    velocity += get_gravity() * delta
  
  if Input.is_action_just_pressed("Flap Wings"):
    velocity.y = FLAP_STRENGTH
  move_and_slide()
