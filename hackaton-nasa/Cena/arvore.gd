extends Area2D
signal entrou
var entrada=0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	entrada+=1
	if (entrada==1):
		$AnimatedSprite2D.play("arvore_crescendo")
		emit_signal("entrou")


func _on_adubar_pressed() -> void:
	$AnimatedSprite2D.play("arvore_pos_adubo")
