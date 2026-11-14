extends CharacterBody2D
@export var bounciness:=1.0
const speed=350
var hp=100
var damage=20
var side='good'
var grown=false
@onready var health_bar=$HealthBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flash_animation: AnimationPlayer = $AnimatedSprite2D/FlashAnimation
@onready var grow_timer: Timer = $grow_timer


var started=false
func _ready() -> void:
	health_bar.value=hp
	animated_sprite_2d.play("chick")
func _process(delta: float) -> void:
	health_bar.value=hp

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('start') and not started:
		randomize()
		velocity=Vector2.RIGHT.rotated(randf()*TAU)*speed
		grow_timer.start()
		started=true


func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity=velocity.bounce(collision.get_normal())*bounciness
		
	if hp<=0:
		queue_free()

	


func _on_grow_timer_timeout() -> void:
	grown=true
	animated_sprite_2d.play("chicken")
