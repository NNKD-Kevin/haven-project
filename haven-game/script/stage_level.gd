extends Node2D
var good_crab_path=preload("res://scenes/good_crab.tscn")
var bad_crab_path=preload('res://scenes/bad_crab.tscn')
var good_chick_path=preload("res://scenes/good_chick.tscn")
var bad_chick_path=preload("res://scenes/bad_chick.tscn")
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var starting_nodes:int
var current_nodes:int

func _ready():
	starting_nodes=get_child_count()
	current_nodes=get_child_count()
	audio_stream_player_2d.play()
func spawn_type(type):
	if type == "good_crab":
		var good_crab = good_crab_path.instantiate()
		randomize()
		good_crab.global_position = Vector2(randi_range(100,200),randi_range(100,200))
		get_parent().add_child(good_crab)
	if type=="good_chick":
		var good_chick = good_chick_path.instantiate()
		randomize()
		good_chick.global_position = Vector2(randi_range(350,400),randi_range(250,300))
		get_parent().add_child(good_chick)
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		for animal in Global.animals:
			spawn_type(animal)
		
	
	
