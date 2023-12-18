extends Projectile

func _hit():
	var emitter = $GPUParticles2D
	emitter.emitting = true
	queue_free()
