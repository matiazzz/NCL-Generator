package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.CondtionAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.SimpleAction

class ConditionActionExtensions {
	
	static def addSimpleCondition(CondtionAction it){
		condition.addSimpleCondition
	}
	
	static def addSimpleAction(CondtionAction it){
		if (simpleAction != null){
			simpleAction.add
		}		
	}
	
	static def addCompoundActions(CondtionAction it){
		if (compoundAction != null)
		'''		
		<compoundAction operator="«compoundAction.operator»">		
			«FOR sa: compoundAction.simpleAction»
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