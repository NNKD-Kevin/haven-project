extends Node2D
@export var animal_scene: PackedScene
@export var enemy_scene: PackedScene
var starting_nodes:int
var current_nodes:int

func _ready():
	starting_nodes=get_child_count()
	current_nodes=get_child_count()
func spawn_type(type):
	if type == "crab":
		pass
		
	
	
