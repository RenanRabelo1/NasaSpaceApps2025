extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta: float) -> void:
	# Get input direction for both axes
	var direction_x := Input.get_axis("esquerda", "direita")
	var direction_y := Input.get_axis("cima", "baixo")
	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED
	update_animations(direction_x, direction_y)
	move_and_slide()

func update_animations(direction_x: float, direction_y: float) -> void:
	# Prioritize horizontal movement for animations
	if direction_x != 0:
		$AnimatedSprite2D.play("lado")
		# Flip sprite based on direction
		if direction_x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction_x < 0:
			$AnimatedSprite2D.flip_h = true
	elif direction_y < 0:  # cima
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	elif direction_y > 0:  # baixo
		$AnimatedSprite2D.play("tras")
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")  # Animação quando parado



func _on_area_2d_area_entered(area: Area2D) -> void:
	$AnimatedSprite2D2.show()
	$Label1.show()
