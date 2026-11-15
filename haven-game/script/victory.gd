extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var weaken: Timer = $Timer
@onready var withdraw: Timer = $Timer2
@onready var weake: Label = $Weaken
@onready var withdrew: Label = $withdrew
@onready var win: Label = $Win
@onready var vic: Timer = $Timer3


func _ready() -> void:
	weake.visible = false
	withdrew.visible = false
	win.visible = false
	animation_player.play("dakr")
	weaken.start()


func _on_timer_timeout() -> void:
	weake.visible = true
	animation_player.play('weakne')
	withdraw.start()

func _on_timer_2_timeout() -> void:
	withdrew.visible = true
	animation_player.play("withdrew")
	vic.start()
	
func _on_timer_3_timeout() -> void:
	win.visible = true
	
