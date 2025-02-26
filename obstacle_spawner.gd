extends Area2D

@export var obstacle_scene: PackedScene
@export var gap_size: float = 200.0

@onready var spawn_area: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
  spawn_obstacle_pair()

func _on_timer_timeout() -> void:
  spawn_obstacle_pair()
  
func spawn_obstacle_pair() -> void:
  var top_obstacle = obstacle_scene.instantiate()
  var top_obstacle_height = top_obstacle.get_node("CollisionShape2D").shape.get_rect().size.y
  var bottom_obstacle = obstacle_scene.instantiate()

  var area_rect: Rect2 = spawn_area.shape.get_rect()
  var spawn_x = area_rect.position.x + area_rect.size.x / 2
  # Pick a random y value for the center of the gap
  var gap_center = randf_range(area_rect.position.y, area_rect.end.y)

  top_obstacle.position = Vector2(spawn_x, gap_center - gap_size / 2 - top_obstacle_height)
  bottom_obstacle.position = Vector2(spawn_x, gap_center + gap_size / 2)

  add_child(top_obstacle)
  add_child(bottom_obstacle)
