extends Node
var battle_started=false
var animals=['good_crab','good_chick','good_turtle']
var level=1

func _ready()->void:
	Engine.time_scale=1.0
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("speedup"):
		Engine.time_scale =3.0
	if Input.is_action_just_released("speedup"):
		Engine.time_scale=1.0
