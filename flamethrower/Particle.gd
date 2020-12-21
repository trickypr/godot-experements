extends Area2D

var lifetime: float = 1
var velocity: Vector2 = Vector2.ZERO

func _ready():
	$LifetimeTimer.wait_time = lifetime
	$LifetimeTimer.start()

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _despawn() -> void:
	queue_free()

func get_class() -> String:
	return "flame"
