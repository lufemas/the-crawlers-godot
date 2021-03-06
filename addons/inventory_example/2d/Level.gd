# 2D Level to demonstrate functionality of InventoryEditor : MIT License
# @author Vladimir Petrenko
extends Node2D

var inventoryManager

export(bool) var clear_inventory = true

onready var _error_ui = $CanvasError as CanvasLayer
onready var _inventory_any = $CanvasInventory/Inventories/InventoryAny
onready var _inventory_clothes = $CanvasInventory/Inventories/InventoryClothes
onready var _inventory_button_ui = $CanvasButton/TextureButton as TextureButton
onready var _inventory_clothes_button_ui = $CanvasButton/TextureButtonClouthes as TextureButton

func _ready() -> void:
	if get_tree().get_root().has_node("InventoryManager"):
		_error_ui.queue_free()
		inventoryManager = get_tree().get_root().get_node("InventoryManager")
		inventoryManager.player = $Player
		if clear_inventory:
			inventoryManager.clear_inventory(_inventory_any.inventory)
			inventoryManager.clear_inventory(_inventory_clothes.inventory)
		_inventory_button_ui.connect("pressed", self, "_on_inventory_button_pressed")
		_inventory_clothes_button_ui.connect("pressed", self, "_on_inventory_clothes_button_pressed")
		

func _on_inventory_button_pressed() -> void:
	if _inventory_any.visible:
		_inventory_any.hide()
	else:
		_inventory_any.show()

func _on_inventory_clothes_button_pressed() -> void:
	if _inventory_clothes.visible:
		_inventory_clothes.hide()
	else:
		_inventory_clothes.show()
