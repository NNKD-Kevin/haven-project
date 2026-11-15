extends Node2D
const SCENES = {
	"good_crab": preload("res://scenes/good_crab.tscn"),
	"good_chick": preload("res://scenes/good_chick.tscn"),
	"good_wolf": preload("res://scenes/good_wolf.tscn"),
	"good_turtle": preload("res://scenes/good_turtle.tscn"),
	"bad_crab": preload("res://scenes/bad_crab.tscn"),
	"bad_chick": preload("res://scenes/bad_chick.tscn"),
	"bad_wolf": preload("res://scenes/bad_wolf.tscn"),
	"bad_turtle": preload("res://scenes/bad_turtle.tscn")
	}


@onready var center_container: CenterContainer = $CenterContainer

const ENEMY_TYPES = ["bad_crab", "bad_chick", "bad_wolf", "bad_turtle"]
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var h_box_container: HBoxContainer = $Recruit/HBoxContainer


var starting_nodes:int
var current_nodes:int

func _ready():
	audio_stream_player_2d.play()
	if center_container:
		center_container.visible = false
func spawn_type(type:String):
	var node = SCENES[type].instantiate()
	var is_good = type.begins_with("good")
	var x_min = 300 if is_good else 700
	node.position = Vector2(randi_range(x_min, x_min + 200), randi_range(150, 500))
	node.add_to_group("animals" if is_good else "enemies")
	get_parent().add_child(node)
func clear():
	if not is_inside_tree():
		return
	for a in get_tree().get_nodes_in_group("animals"):
		a.queue_free()
	for e in get_tree().get_nodes_in_group("enemies"):
		e.queue_free()
	Global.ready_to_start=false
func _process(_delta: float) -> void:
	if not Global.combat:
		return

	var animals_left = get_tree().get_nodes_in_group("animals").size()
	var enemies_left = get_tree().get_nodes_in_group("enemies").size()

	if animals_left == 0:
		Global.combat = false
		get_tree().change_scene_to_file("res://scenes/Defeat.tscn")
		clear()
	elif enemies_left == 0:
		Global.combat = false
		Global.level += 1
		print(Global.level)
		clear()
		h_box_container.choose()
		

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start") and not Global.combat and Global.ready_to_start:
		if center_container:
			center_container.visible=false
		for i in range(Global.level):
			spawn_type(ENEMY_TYPES.pick_random())
		for animal in Global.animals:
			spawn_type(animal)
		Global.combat = true
