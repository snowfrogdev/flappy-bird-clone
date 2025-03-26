extends CanvasLayer

@onready var game: Node2D = $"Game"
@onready var game_over_overlay: ColorRect = $"GameOverOverlay"
@onready var score_control: Control = $"Score"
@onready var title_screen: Control = $"TitleScreen"

var waiting_for_music_bar = 0
const BPM = 140
const BEATS_PER_BAR = 4
const BEAT_LENGTH = 60.0 / BPM
const BAR_LENGTH = BEAT_LENGTH * BEATS_PER_BAR

func _on_button_ok_pressed() -> void:
  game_over_overlay.hide()
  game.get_tree().reload_current_scene()

func _ready() -> void:
  if Music.playing == false:
    Music.play()

func _unhandled_input(event: InputEvent) -> void:
  print("Input event: ", event)
  if game.get_tree().paused and not game_over_overlay.is_visible_in_tree() and event.is_action_pressed("Flap Wings"):
    game.get_tree().paused = false
    score_control.show()
    title_screen.hide()

    var current_bar = (Music.get_playback_position() + AudioServer.get_time_since_last_mix()) / BAR_LENGTH
    waiting_for_music_bar = int(current_bar) + 1


func _process(_delta):
  if waiting_for_music_bar > 0:
    var current_bar = (Music.get_playback_position() + AudioServer.get_time_since_last_mix()) / BAR_LENGTH
    if int(current_bar) >= waiting_for_music_bar:
      waiting_for_music_bar = 0
      Music.stream.set_sync_stream_volume(0, -3)
      Music.stream.set_sync_stream_volume(4, -3)
      Music.stream.set_sync_stream_volume(5, -3)
      Music.set_volume_db(0)
