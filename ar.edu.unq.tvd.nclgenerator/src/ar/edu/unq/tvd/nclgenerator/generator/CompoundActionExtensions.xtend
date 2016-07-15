package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.CompoundAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media

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
}