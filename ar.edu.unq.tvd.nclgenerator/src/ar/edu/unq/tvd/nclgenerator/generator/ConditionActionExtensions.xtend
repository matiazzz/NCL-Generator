package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.ConditionAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.SimpleAction

class ConditionActionExtensions {
	
	static def addSimpleCondition(ConditionAction it){
		condition.addSimpleCondition
	}
	
	static def addSimpleAction(ConditionAction it){
		if (simpleAction != null){
			simpleAction.add
		}		
	}
	
	static def addCompoundActions(ConditionAction it){
		if (compoundAction != null)
		'''		
		<compoundAction operator="«compoundAction.operator»">		
			«FOR sa: compoundAction.simpleActions»
			 «sa.add»
			«ENDFOR»
		</compoundAction>
		'''
	}
	
	static def add(SimpleAction it){
		if (isSet) {
			'''
			<simpleAction role="set" value="«set.property.value»"/>
			'''
		}
		else{
			'''
			<simpleAction role="«action»"/>
			'''
		}
	}
	
}