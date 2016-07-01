package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.CompoundAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*

class CompoundActionExtensions {
	
	
	static def addBinds(CompoundAction it){
			'''
			«FOR sa : simpleAction»
			«sa.addBind»
			«ENDFOR»
			'''
			
	}
}