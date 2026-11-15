extends CharacterBody2D
@export var bounciness:=1.0
const speed=150
var hp=150
var side='good'
var type='good_pig'
@onready var health_bar=$HealthBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flash_animation: AnimationPlayer = $AnimatedSprite2D/FlashAnimation
@onready var cooldown: Timer = $cooldown
@onready var stun: Timer = $stun
var moving=true

var poo_path=preload("res://scenes/good_poo.tscn")

var ready_to_hit=true

var started=false
func _ready() -> void:
	health_bar.value=hp
	randomize()
	velocity=Vector2.RIGHT.rotated(randf()*TAU)*speed
func _process(delta: float) -> void:
	health_bar.value=hp
		 

func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision and moving:
		velocity=velocity.bounce(collision.get_normal())*bounciness
		var collider=collision.get_collider()
		if not (collider is CharacterBody2D) and ready_to_hit:
			fire()
			ready_to_hit=false
			cooldown.start()
		else:
			if collider is CharacterBody2D and ready_to_hit:
				if collider.side==side:
					fire()
					ready_to_hit=false
					cooldown.start()
	if hp<=0:
		queue_free()

func fire():
	var poo = poo_path.instantiate()
	poo.global_position = $CollisionShape2D.global_position
	get_parent().add_child(poo)
	#audio_stream_player_2d.play()


func _on_cooldown_timeout() -> void:
	ready_to_hit=true


func _on_stun_timeout() -> void:
	moving=true
