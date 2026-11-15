extends Node2D
const SCENES = {
	"good_crab": preload("res://scenes/good_crab.tscn"),
	"good_chick": preload("res://scenes/good_chick.tscn"),
	"good_wolf": preload("res://scenes/good_wolf.tscn"),
	"good_turtle": preload("res://scenes/good_turtle.tscn"),
	"bad_crab": preload("res://scenes/bad_crab.tscn"),
	"bad_chick": preload("res://scenes/bad_chick.tscn"),
	"bad_wolf": preload("res://scenes/bad_wolf.tscn"),
	"bad_turtle": preload("res://scenes/bad_turtle.tscn"),
}
const ENEMY_TYPES = ["bad_crab", "bad_chick", "bad_wolf", "bad_turtle"]
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var ready_to_start = false
var combat=false
@onready var h_box_container: HBoxContainer = $Recruit/HBoxContainer

var starting_nodes:int
var current_nodes:int

func _ready():
	audio_stream_player_2d.play()
func spawn_type(type:String):
	var node = SCENES[type].instantiate()
	var is_good = type.begins_with("good")
	var x_min = 300 if is_good else 700
	node.position = Vector2(randi_range(x_min, x_min + 200), randi_range(150, 500))
	node.add_to_group("animals" if is_good else "enemies")
	get_parent().add_child(node)

func _process(_delta: float) -> void:
	if not combat:
		return

	var animals_left = get_tree().get_nodes_in_group("animals").size()
	var enemies_left = get_tree().get_nodes_in_group("enemies").size()

	if animals_left == 0:
		combat = false
		get_tree().change_scene_to_file("res://scenes/Defeat.tscn")
	elif enemies_left == 0:
		combat = false
		Global.level += 1
		print(Global.level)
		

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start") and not combat:
		var count = ceil(Global.level / 3.0)
		for i in range(count):
			spawn_type(ENEMY_TYPES.pick_random())
		for animal in Global.animals:
			spawn_type(animal)
		combat = true
