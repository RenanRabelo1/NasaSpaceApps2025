extends Node
var milho=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




func _process(_delta: float) -> void:
	pass

func _on_milho_entrou() -> void:
	$CharacterBody2D/hud/ProgressBar.value += 10

func _on_fechar_mapa_pressed() -> void:
	$CharacterBody2D/Grafico.hide()
	$CharacterBody2D/Grafico/Fechar_Mapa.hide()


func _on_menu_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Cena/mapa_mundi.tscn")


func _on_arvore_pressed() -> void:
	$CharacterProgressBar.value+=10
	
