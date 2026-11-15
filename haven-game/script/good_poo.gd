extends CharacterBody2D
var bounciness = 1.0

func _physics_process(delta: float) -> void:
	if not Global.combat:
		queue_free()
		return
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("enemies"):
			collider.hp -= 10
			collider.flash_animation.play("flash")
			if "moving" in collider:
				collider.moving = false
				collider.stun.start()
			queue_free()
		else:
			velocity = velocity.bounce(collision.get_normal()) * bounciness
