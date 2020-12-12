extends Node2D

const missile = preload("res://missiles/Missile.tscn")

onready var target = $Target

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var inst = missile.instance()
		inst.position = get_viewport().get_mouse_position()
		inst.target = _get_closest(inst)
		add_child(inst)

func _get_closest(A):
	var min_distance = 99999999.0
	var closest_object = null
	for B in get_children():
		if B == A : continue
		if B.get_class() != "target": continue
		
		var dist = A.global_position.distance_to(B.global_position)
		if dist < min_distance: 
			min_distance = dist
			closest_object = B
	return closest_object
