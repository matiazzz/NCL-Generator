package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.CompoundAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media
import java.util.ArrayList

class CompoundActionExtensions {
	
	
	static def addBinds(CompoundAction it, Media media){
			'''
			«FOR sa : simpleActions»
			«sa.addBind(media)»
			«ENDFOR»
			'''	
	}
	
	static def getPropertiesFromSimpleActions(CompoundAction it){
		simpleActions.filter[simpleAction | simpleAction.isSet].map[simpleAction | simpleAction.set.property.name]
	}
	
	static def getSimpleActionsNames(CompoundAction it){
		var ArrayList<String> actions = newArrayList()
		if(simpleActions.filter[s | s.isSet].size > 0) actions.add("set")
		actions.addAll(simpleActions.map[s | s.action.getName])
		actions.toSet
	}
}