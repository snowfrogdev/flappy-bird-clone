class_name ObstaclePair extends Node2D

var speed: float = 250.0
var gap_size: float = 250.0

@onready var top_obstacle: StaticBody2D = $TopObstacle
@onready var bottom_obstacle: StaticBody2D = $BottomObstacle
@onready var score_sfx: AudioStreamPlayer = $ScoreSfx

signal score_point

func _ready():
  position_obstacles(200, 400) # Default values (only for debugging)

func _process(delta):
  position.x -= speed * delta # Move obstacles to the left
  if position.x < -10000:
    queue_free()

func randomize_gap_position(min_y, max_y):
  position_obstacles(min_y, max_y)

func position_obstacles(min_y, max_y):
  # Randomize the Y position for the bottom obstacle within the range
  var bottom_y = randf_range(min_y + gap_size, max_y)

  # Position the bottom pipe
  bottom_obstacle.position = Vector2(0, bottom_y)

  # Position the top pipe relative to the bottom obstacle + gap size
  var top_obstacle_sprite: Sprite2D = top_obstacle.get_node("TopObstacle")
  var top_obstacle_visual_height = top_obstacle_sprite.texture.get_height()
  top_obstacle.position = Vector2(0, bottom_y - gap_size - top_obstacle_visual_height)


func _on_score_trigger_body_exited(body: Node2D) -> void:
  if body.is_in_group("Player"):
    score_sfx.play()
    score_point.emit()
