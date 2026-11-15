extends Node
var battle_started=false
var animals=[]
var enemies=[]
var level=1
var ready_to_start = false
var combat=false
func _ready()->void:
	Engine.time_scale=1.0
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("speedup"):
		Engine.time_scale =3.0
	if Input.is_action_just_released("speedup"):
		Engine.time_scale=1.0
