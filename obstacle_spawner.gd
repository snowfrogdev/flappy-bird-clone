extends Node2D

@export var obstacle_scene: PackedScene
@export var spawn_interval: float = 2.5
@export var gap_size: float = 250.0
@export var speed: float = 500.0

@onready var timer = $Timer
@onready var top_gap_limit = $TopGapLimit
@onready var bottom_gap_limit = $BottomGapLimit

signal score_point

func _ready():
  timer.wait_time = spawn_interval
  timer.timeout.connect(spawn_obstacle)
  timer.start()

func spawn_obstacle():
  var obstacle := obstacle_scene.instantiate() as ObstaclePair
  add_child(obstacle)

  obstacle.score_point.connect(_on_score_point)

  obstacle.speed = speed
  obstacle.gap_size = gap_size

  # Use marker positions to determine vertical range
  var min_y = top_gap_limit.position.y
  var max_y = bottom_gap_limit.position.y

  # Randomly place the gap between min and max markers
  obstacle.position_obstacles(min_y, max_y)

func _on_score_point():
  print("ObstacleSpawner detected score")
  score_point.emit()