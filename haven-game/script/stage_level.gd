extends Node2D
var good_crab_path=preload("res://scenes/good_crab.tscn")
var bad_crab_path=preload('res://scenes/bad_crab.tscn')
var good_chick_path=preload("res://scenes/good_chick.tscn")
var bad_chick_path=preload("res://scenes/bad_chick.tscn")
var good_wolf_path=preload("res://scenes/good_wolf.tscn")
var bad_wolf_path=preload("res://scenes/bad_wolf.tscn")
var good_turtle_path=preload("res://scenes/good_turtle.tscn")
var bad_turtle_path=preload("res://scenes/bad_turtle.tscn")
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var ready_to_start = false
var combat=false
@onready var h_box_container: HBoxContainer = $Recruit/HBoxContainer

var starting_nodes:int
var current_nodes:int

func _ready():
	audio_stream_player_2d.play()
func spawn_type(type):
	if type == "good_crab":
		var good_crab = good_crab_path.instantiate()
		randomize()
		good_crab.global_position = Vector2(randi_range(300,500),randi_range(150,500))
		get_parent().add_child(good_crab)
	if type=="good_chick":
		var good_chick = good_chick_path.instantiate()
		randomize()
		good_chick.global_position = Vector2(randi_range(300,500),randi_range(150,500))
		get_parent().add_child(good_chick)
	if type=="good_wolf":
		var good_wolf = good_wolf_path.instantiate()
		randomize()
		good_wolf.global_position = Vector2(randi_range(300,500),randi_range(150,500))
		get_parent().add_child(good_wolf)
	if type=="good_turtle":
		var good_turtle = good_turtle_path.instantiate()
		randomize()
		good_turtle.global_position = Vector2(randi_range(300,500),randi_range(150,500))
		get_parent().add_child(good_turtle)
	if type == "bad_crab":
		var bad_crab = bad_crab_path.instantiate()
		randomize()
		bad_crab.global_position = Vector2(randi_range(700,900),randi_range(150,500))
		get_parent().add_child(bad_crab)
	if type=="bad_chick":
		var bad_chick = bad_chick_path.instantiate()
		randomize()
		bad_chick.global_position = Vector2(randi_range(700,900),randi_range(150,500))
		get_parent().add_child(bad_chick)
	if type=="bad_wolf":
		var bad_wolf = bad_wolf_path.instantiate()
		randomize()
		bad_wolf.global_position = Vector2(randi_range(700,900),randi_range(150,500))
		get_parent().add_child(bad_wolf)
	if type=="bad_turtle":
		var bad_turtle = bad_turtle_path.instantiate()
		randomize()
		bad_turtle.global_position = Vector2(randi_range(700,900),randi_range(150,500))
		get_parent().add_child(bad_turtle)

func _process(delta: float) -> void:
	if len(Global.enemies)==0 and combat:
		combat=false
		Global.level+=1
		print(Global.level)
	if len(Global.animals)==0:
		combat=false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("start") and not combat:
		var count=ceil(Global.level/3.0)
		for i in range(count):
			randomize()
			var gacha=randi_range(1,4)
			if gacha==1:Global.enemies.append('bad_crab')
			elif gacha==2:Global.enemies.append('bad_chick')
			elif gacha==3:Global.enemies.append('bad_wolf')
			elif gacha==4:Global.enemies.append('bad_turtle')
		for animal in Global.animals:
			spawn_type(animal)
		for enemy in Global.enemies:
			spawn_type(enemy)
		combat=true
		
	
	
