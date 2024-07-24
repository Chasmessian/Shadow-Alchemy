class_name viewport
extends Control
static var instance = null
var patient : viewport_patient = null
func _init():
	if(instance==null):
		instance = self
	else:
		queue_free()
func bringOutPatient(newPatient):
	#patient.texture = newPatient.texture
	patient.walkTo(get_node("Walkto").position, 5)
	patient.flipAtEnd = true
	#patient.flip()
func patientLeave():
	#patient.flip()
	patient.walkTo(get_node("Leave").positon, 5)
	patient.flipAtEnd = true
	pass
func _ready():
	patient = get_node("Patient")
	print(patient)
	bringOutPatient(patient)
