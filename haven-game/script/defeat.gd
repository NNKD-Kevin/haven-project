extends Node2D
@onready var timer_die: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var defeated: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defeated.visible = false
	timer_die.start()
	animation_player.play("darken")
	
	
func _on_timer_timeout() -> void:
	defeated.visible = true
