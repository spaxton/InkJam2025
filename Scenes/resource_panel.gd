extends Node2D

func updateFocusLabel(text):
	$"LabelsVbox/FocusLabel".text = text
	
func updateResolveLabel(text):
	$"LabelsVbox/ResolveLabel".text = text
	
func updateTimeLabel(text):
	$"LabelsVbox/TimeLabel".text = text
	
func updateExhaustionLabel(text):
	$"LabelsVbox/ExhaustionLabel".text = text
