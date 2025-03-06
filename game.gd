extends Node2D

var score = 0

@export var game_over_score_label: Label

@onready var score_label: Label = $"/root/CanvasLayer/Score/Label"
@onready var game_over_sfx: AudioStreamPlayer = $"GameOverSfx"
@onready var game_over_overlay: ColorRect = $"/root/CanvasLayer/GameOverOverlay"

func _ready():
  get_tree().paused = false
  score_label.show()


func _on_player_player_collided() -> void:
  get_tree().paused = true
  game_over_sfx.play()
  score_label.hide()
  game_over_overlay.show()
  # set score value on game over overlay
  game_over_score_label.text = str(score)
   

func _on_obstacle_spawner_score_point() -> void:
  score += 1
  score_label.text = str(score)
