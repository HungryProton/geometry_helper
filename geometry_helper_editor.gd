tool
extends EditorPlugin


# --
# EditorPlugin overrides
# --

func get_name(): 
	return "GeometryHelper"

func _enter_tree():
	add_custom_type(
		"PolygonMesh", 
		"PolygonPath",
		load("res://addons/geometry_helper/tools/polygon_mesh.gd"),
		load("res://addons/geometry_helper/icons/polygon_mesh.svg")
	)

func _exit_tree():
	remove_custom_type("PolygonMesh")

# --
# Internal methods
# --

