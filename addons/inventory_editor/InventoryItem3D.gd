# Item3D as custom type for InventoryEditor : MIT License
# @author Vladimir Petrenko
tool
extends Spatial
class_name Item3D

var inside 
var _inventoryManager
const InventoryManagerName = "InventoryManager"

export(String) var item_put # item_uuid 
export(String) var to_inventory # inventory_uuid
export(int) var quantity = 1
export(bool) var remove_collected = true

func _ready() -> void:
	if get_tree().get_root().has_node(InventoryManagerName):
		_inventoryManager = get_tree().get_root().get_node(InventoryManagerName)
		var area = get_node("InventoryItem_" + item_put)
		if area:
			if not area.is_connected("body_entered", self, "_on_body_entered"):
				assert(area.connect("body_entered", self, "_on_body_entered") == OK)
			if not area.is_connected("body_exited", self, "_on_body_exited"):
				assert(area.connect("body_exited", self, "_on_body_exited") == OK)

func _process(delta: float) -> void:
	if Engine.editor_hint and item_put and not item_put.empty():
		if not has_node("InventoryItem_" + item_put):
			_remove_old_childs()
			if not get_tree().edited_scene_root.has_node(InventoryManagerName):
				var root = get_tree().edited_scene_root
				var manager = Spatial.new()
				manager.name = InventoryManagerName
				manager.set_script(load("res://addons/inventory_editor/InventoryManager.gd"))
				root.add_child(manager)
				manager.set_owner(get_tree().edited_scene_root)
				var item_db = manager.get_item_db(item_put)
				if item_db and not item_db.scene.empty():
					var scene = load(item_db.scene).instance()
					if scene:
						scene.name = "InventoryItem_" + item_db.uuid
						add_child(scene)
						scene.set_owner(get_tree().edited_scene_root)
				root.remove_child(manager)
				manager.queue_free()

func _remove_old_childs() -> void:
	for child in get_children():
		if child.name.begins_with("InventoryItem_"):
			remove_child(child)
			child.queue_free()

func _on_body_entered(body: Node) -> void:
	if _inventoryManager.player != body:
		return
	inside = true
	var remainder = _inventoryManager.add_item(to_inventory, item_put, quantity)
	if remove_collected and remainder == 0:
		queue_free() 

func _on_body_exited(body: Node) -> void:
	inside = false

