extends CharacterBody2D
class_name Animal
@export var bounciness:=1.0
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('start'):
		randomize()
		velocity=Vector2(randf(),randf())

func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity=velocity.bounce(collision.get_normal())*bounciness

	
