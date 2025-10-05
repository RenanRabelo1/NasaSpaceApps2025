extends Area2D
signal entrou
var entrada=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_body_entered(_body: Node2D) -> void:
	entrada+=1
	if (entrada==1):
		$AnimatedSprite2D.play("trigo_crescendo")
		emit_signal("entrou")
	
