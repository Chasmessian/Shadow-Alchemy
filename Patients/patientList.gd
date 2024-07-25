class_name PatientList
extends Node
static var patients = ["res://Patients/List/Patient1/patient1.gd", "res://Patients/List/Patient2/patient2.gd"] #contains script references, World will load thems
static func getPatient():
	if(len(patients)==0):
		return null
	print(len(patients)-1)
	var randNum = randi_range(0,len(patients)-1)
	#print(randNum)
	return patients.pop_at(randNum)
