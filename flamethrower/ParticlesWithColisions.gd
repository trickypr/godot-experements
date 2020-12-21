extends Node2D

const PARTICLE = preload("res://flamethrower/Particle.tscn")

export var magnitude: int
export (float, 1) var velocity_randomness = 0
export (float, 0, 10) var lifetime = 1
export (float, 1) var lifetime_randomness = 0
export (int, 0, 10) var frames_per_particle = 0

onready var particles = $Particles

var velocity: Vector2 = Vector2.ZERO
var i: int = 0

func _randomise(default: float) -> float:
	return rand_range(default * (1 - lifetime_randomness), default)

func _randomise_vector(default: Vector2) -> Vector2:
	var deg = rad2deg(default.angle())
	var mag = default.distance_to(Vector2.ZERO)
	
	var rand_add = rand_range(-180 * velocity_randomness, 180 * velocity_randomness)
	var rand_deg = deg + rand_add
	var new_vec = Vector2.RIGHT.rotated(deg2rad(rand_deg)) * mag
	
	return new_vec

func _process(_delta: float) -> void:
	i += 1
	
	if i >= frames_per_particle:
		var dir = particles.get_angle_to(get_global_mouse_position())
		velocity = Vector2.RIGHT.rotated(dir) * magnitude
		
		var particle = PARTICLE.instance()
		particle.velocity = _randomise_vector(velocity)
		particle.lifetime = _randomise(lifetime)
		particles.add_child(particle)
		
		i = 0

