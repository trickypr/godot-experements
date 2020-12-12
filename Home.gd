extends Control

var missile = preload("res://missiles/Missile test.tscn")

func _missile():
	get_tree().change_scene_to(missile)
