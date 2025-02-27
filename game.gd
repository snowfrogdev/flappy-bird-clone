extends Node2D

var score = 0

@onready var canvas_layer: CanvasLayer = $"/root/CanvasLayer"
@onready var score_label: Label = $"/root/CanvasLayer/Control/Label"

func _ready():
  # Connect the resized signal to a function
  get_viewport().connect("size_changed", Callable(self, "_update_canvas_offset"))
  _update_canvas_offset() # Initial adjustment
  get_tree().paused = false

func _update_canvas_offset():
  var screen_width = get_viewport_rect().size.x
  var base_width = ProjectSettings.get("display/window/size/viewport_width")
  var offset_x = (screen_width - base_width) / 2
  
  # Move the CanvasLayer to center content
  canvas_layer.transform.origin.x = offset_x

func _on_player_player_collided() -> void:
  # Restart the game
  get_tree().paused = true
  await get_tree().create_timer(1.0).timeout
  get_tree().reload_current_scene()


func _on_obstacle_spawner_score_point() -> void:
  print("Game detected score")
  score += 1
  score_label.text = str(score)
