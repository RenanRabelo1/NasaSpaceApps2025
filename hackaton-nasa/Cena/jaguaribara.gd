extends Node

var milho = 0
var arvore = 0

@onready var progress_bar = $CharacterBody2D/hud/ProgressBar

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	map()

func map():
	if Input.is_action_just_pressed("Mapa"):
		$CharacterBody2D/Grafico.show()
		$CharacterBody2D/Grafico/Fechar_Mapa.show()

func _on_fechar_mapa_pressed() -> void:
	$CharacterBody2D/Grafico.hide()
	$CharacterBody2D/Grafico/Fechar_Mapa.hide()

func _on_menu_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Cena/mapa_mundi.tscn")

func _on_arvore_pressed() -> void:
	progress_bar.value += 15
	if progress_bar.value >= 100:
		get_tree().change_scene_to_file("res://Cena/vitoria.tscn")

func _on_milho_entrou() -> void:
	progress_bar.value += 10
	if progress_bar.value >= 100:
		get_tree().change_scene_to_file("res://Cena/vitoria.tscn")
