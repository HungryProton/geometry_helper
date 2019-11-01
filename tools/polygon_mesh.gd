tool
extends PolygonPath

# --
# PolygonMesh
# --
# Simple wrapper around CSG polygon mesh to use a PolygonPath as the
# main input instead of a manually defined polygon array
#
# --
#
# --

class_name PolygonMesh

## --
## Internal variables
## --

var csg_mesh : CSGPolygon

## --
## Internal methods
## --

func _ready():
	connect("curve_updated", self, "_rebuild")

func _rebuild():
	csg_mesh = get_node("CSGMesh")
	if not csg_mesh:
		csg_mesh = CSGPolygon.new()
		csg_mesh.transform.basis.x
		csg_mesh.transform.origin = Vector3.ZERO
		csg_mesh.set_name("CSGMesh")
		add_child(csg_mesh)
		csg_mesh.set_owner(get_tree().get_edited_scene_root())

	csg_mesh.polygon = polygon_points
