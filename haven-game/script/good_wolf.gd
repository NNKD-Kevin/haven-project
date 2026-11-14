extends CharacterBody2D
@export var bounciness:=1.0
const speed=350
var hp=100
var side='good'
var type='good_wolf'
@onready var health_bar=$HealthBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flash_animation: AnimationPlayer = $AnimatedSprite2D/FlashAnimation
@onready var devour_timer: Timer = $devour_timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var devour_ready=false
var started=false

func _ready() -> void:
	health_bar.value=hp
func _process(delta: float) -> void:
	health_bar.value=hp
	if devour_ready:
		hp-=delta*5

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('start') and not started:
		randomize()
		velocity=Vector2.RIGHT.rotated(randf()*TAU)*speed
		started=true
		devour_timer.start()


func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity=velocity.bounce(collision.get_normal())*bounciness
		var collider=collision.get_collider()
		if collider is CharacterBody2D:
			if collider.side=='bad' and devour_ready:
				collider.queue_free()
				devour_ready=false
				devour_timer.start()
				hp+=25
		
	if hp<=0:
		queue_free()
	if velocity.x<0:
		animated_sprite_2d.flip_h=true
	else:
		animated_sprite_2d.flip_h=false


func _on_devour_timer_timeout() -> void:
	devour_ready=true
	audio_stream_player_2d.play()
