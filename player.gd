extends CharacterBody2D

@export var FLAP_STRENGTH: float = -300.0
@export var TILT_FACTOR: float = 0.001
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var flap_sound: AudioStreamPlayer = $WingsFlapSfx

signal player_collided()

func _ready() -> void:
  animated_sprite.play()

func _physics_process(delta: float) -> void:
  if not is_on_floor():
    velocity += get_gravity() * delta
  
  if Input.is_action_just_pressed("Flap Wings"):
    velocity.y = FLAP_STRENGTH
    flap_sound.pitch_scale = 1.0 + randf_range(-0.05, 0.05)
    flap_sound.play()
  
  rotation = clamp(velocity.y * TILT_FACTOR, deg_to_rad(-20), deg_to_rad(20))
  
  var collision := move_and_collide(velocity * delta)

  if collision:
    player_collided.emit()
