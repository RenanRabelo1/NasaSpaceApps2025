extends Node
var milho=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




func _process(delta: float) -> void:
	map()

func map():
	if Input.is_action_just_pressed("Mapa"):
		$CharacterBody2D/Grafico.show()
		$CharacterBody2D/Grafico/Fechar_Mapa.show()

func _on_milho_entrou() -> void:
	milho+=1
	if (milho==1):
		$CharacterBody2D/hud/Label.text=str(milho)

func _on_fechar_mapa_pressed() -> void:
	$CharacterBody2D/Grafico.hide()
	$CharacterBody2D/Grafico/Fechar_Mapa.hide()


func _on_menu_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Cena/mapa_mundi.tscn")
