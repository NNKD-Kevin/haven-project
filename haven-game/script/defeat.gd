extends Node2D
@onready var timer_die: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var defeated: Label = $Label
@onready var timer_bounce: Timer = $Timer2
@onready var bounce: Label = $Label2
@onready var timer_retry: Timer = $Timer3
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bounce.visible = false
	defeated.visible = false
	button.visible = false
	timer_die.start()
	animation_player.play("darken")
	
	
func _on_timer_timeout() -> void:
	defeated.visible = true
	timer_bounce.start()


func _on_timer_2_timeout() -> void:
	bounce.visible = true
	timer_retry.start()
	
func _on_timer_3_timeout() -> void:
	button.visible = true
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	Global.animals=[]
	Global.level=1
