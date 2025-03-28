extends Node2D

var score = 0

@export var game_over_score_label: Label

@onready var score_label: Label = $"/root/CanvasLayer/Score/Label"
@onready var game_over_sfx: AudioStreamPlayer = $"GameOverSfx"
@onready var game_over_overlay: ColorRect = $"/root/CanvasLayer/GameOverOverlay"
@onready var best_label: Label = $"/root/CanvasLayer/GameOverOverlay/HBoxContainer/VBoxContainer_Best/Label_BestValue"

func _ready():
  get_tree().paused = true
  score_label.show()
  var sm = load("res://score_manager.gd").new()
  var high_score = sm.load_highscore()
  best_label.text = str(high_score)


func _on_player_player_collided() -> void:
  get_tree().paused = true
  game_over_sfx.play()
  score_label.hide()
  game_over_overlay.show()
  game_over_score_label.text = str(score)
  var sm = load("res://score_manager.gd").new()
  var high_score = sm.load_highscore()
  if score > high_score:
    sm.save_highscore(score)
    best_label.text = str(score)

  Music.stream.set_sync_stream_volume(0, -60)
  Music.stream.set_sync_stream_volume(4, -60)
  Music.stream.set_sync_stream_volume(5, -60)
  Music.set_volume_db(-5)
   

func _on_obstacle_spawner_score_point() -> void:
  score += 1
  score_label.text = str(score)
