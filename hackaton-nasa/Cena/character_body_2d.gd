extends CharacterBody2D
var igual = 0
var SPEED = 200.0

func _physics_process(_delta: float) -> void:
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



func _on_area_2d_area_entered(_area: Area2D) -> void:
	if igual == 0:
		$AnimatedSprite2D2.show()
		$Label1.show()
		$"Plantio direto".show()
		$Enxada.show()
	if igual == 1:
		$qualadubodevousar.show()
		$AnimatedSprite2D2.show()
		$cooldownadubo.start()


func _on_enxada_pressed() -> void:
	$achomelhornao.show()
	$Label1.hide()
	$Enxada.hide()
	$"Plantio direto".hide()
	$cooldown.start()
	igual += 1


func _on_plantio_direto_pressed() -> void:
	$Label1.hide()
	$Enxada.hide()
	$"Plantio direto".hide()
	$voceestacerto.show()
	$cooldownplantio.start()
	igual += 1

func _on_cooldown_timeout() -> void:
	$vouusarplantiodireto.show()
	$voceestacerto.hide()
	$achomelhornao.hide()
	$cooldown2.start()

func _on_cooldown_2_timeout() -> void:
	$vouusarplantiodireto.hide()
	$AnimatedSprite2D2.hide()
	$explicacao_plantio_direto.show()
	$explicacao_plantio_direto/Button.show()

func _on_cooldownplantio_timeout() -> void:
	$voceestacerto.hide()
	$AnimatedSprite2D2.hide()


func _on_button_pressed() -> void:
	$explicacao_plantio_direto.hide()
	$explicacao_errada.hide()


func _on_cooldownadubo_timeout() -> void:
	$explicacao_adubo.show()
	$qualadubodevousar.hide()
	$AnimatedSprite2D2.hide()
	igual += 1



func _on_agrotoxico_pressed() -> void:
	$explicacao_adubo.hide()
	$explicacao_errada.show()
func _on_quimico_pressed() -> void:
	$explicacao_adubo.hide()
	$explicacao_errada.show()
func _on_nenhum_pressed() -> void:
	$explicacao_adubo.hide()
	$explicacao_errada.show()

func _on_organico_pressed() -> void:
	$explicacao_adubo.hide()
	$realmenteemelhor.show()
	$AnimatedSprite2D2.show()
	$cooldownrealmente.start()

func _on_cooldownrealmente_timeout() -> void:
	$realmenteemelhor.hide()
	$AnimatedSprite2D2.hide()
