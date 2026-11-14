extends CharacterBody2D
var bounciness=1.0
var side=null

func _physics_process(delta: float) -> void:
	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity=velocity.bounce(collision.get_normal())*bounciness
		var collider=collision.get_collider()
		if collider is CharacterBody2D and collider.type!='good_chick':
			if collider.side=='bad':
				collider.hp-=10
				collider.flash_animation.play('flash')
				queue_free()
			elif collider.side=='good':
				collider.hp+=10
				queue_free()
			
