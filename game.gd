extends Node2D

@onready var canvas_layer: CanvasLayer = $"/root/CanvasLayer"

func _ready():
    # Connect the resized signal to a function
    get_viewport().connect("size_changed", Callable(self, "_update_canvas_offset"))
    _update_canvas_offset() # Initial adjustment

func _update_canvas_offset():
    var screen_width = get_viewport_rect().size.x
    var base_width = ProjectSettings.get("display/window/size/viewport_width")
    var offset_x = (screen_width - base_width) / 2
    
    # Move the CanvasLayer to center content
    canvas_layer.transform.origin.x = offset_x
