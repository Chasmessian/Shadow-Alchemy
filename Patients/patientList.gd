class_name PatientList
extends Node
static var patients = ["res://Patients/List/Patient1/patient1.gd"] #contains script references, World will load thems
static func getPatient():
	if(len(patients)==0):
		return null
	var randNum = randf_range(0,len(patients)-1)
	return patients[randNum]
	
