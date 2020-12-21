extends Area2D

onready var color_rect = $ColorRect
onready var color_timer = $Timer

export var collision_color: Color
export var default_color: Color

func _ready():
	color_rect.color = default_color

func _entered(area):
	if area.get_class() == "flame":
		color_rect.color = collision_color
		color_timer.start()

func _reset():
	color_rect.color = default_color
