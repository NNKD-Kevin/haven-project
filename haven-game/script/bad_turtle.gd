extends CharacterBody2D
@export var bounciness:=1.0
const speed=50
var hp=300
var damage=10
var side='bad'
var type='bad_turtle'
@onready var health_bar=$HealthBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flash_animation: AnimationPlayer = $AnimatedSprite2D/FlashAnimation


var started=false
func _ready() -> void:
	health_bar.value=hp
func _process(delta: float) -> void:
	health_bar.value=hp
	randomize()
	velocity=Vector2.RIGHT.rotated(randf()*TAU)*speed
		 

func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity=velocity.bounce(collision.get_normal())*bounciness
		var collider=collision.get_collider()
		if collider is CharacterBody2D:
			if collider.side=='good':
				collider.hp-=damage
				health_bar.value=hp
				animated_sprite_2d.play("attack")
				collider.flash_animation.play("flash")
	if hp<=0:
		queue_free()

	
