extends CharacterBody2D
@export var bounciness:=1.0
const speed=300
var hp=100
var damage=20
var side='good'
var type='good_crab'
@onready var health_bar=$HealthBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flash_animation: AnimationPlayer = $AnimatedSprite2D/FlashAnimation
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


var started=false
func _ready() -> void:
	health_bar.value=hp
	animated_sprite_2d.play("default")
	$AnimatedSprite2D.animation_finished.connect(_on_animation_finished)
func _process(delta: float) -> void:
	health_bar.value=hp

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('start') and not started:
		randomize()
		velocity=Vector2.RIGHT.rotated(randf()*TAU)*speed
		started=true          

func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity=velocity.bounce(collision.get_normal())*bounciness
		var collider=collision.get_collider()
		if collider is CharacterBody2D:
			if collider.side=='bad':
				collider.hp-=damage
				health_bar.value=hp
				animated_sprite_2d.play("attack")
				collider.flash_animation.play("flash")
				audio_stream_player_2d.play()
	if hp<=0:
		queue_free()

	

func _on_animation_finished() -> void:
		animated_sprite_2d.play("default")
