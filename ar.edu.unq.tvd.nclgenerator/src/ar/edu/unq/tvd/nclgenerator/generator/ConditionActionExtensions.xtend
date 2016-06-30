package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.CondtionAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionExtensions.*

class ConditionActionExtensions {
	
	static def addSimpleCondition(CondtionAction it){
		condition.addSimpleCondition
	}
	
	static def addSimpleAction(CondtionAction it){
		'''
		«IF simpleAction.action != null»
			<simpleAction role="«simpleAction.action»"/>
		«ENDIF»
		'''
	}
	
	static def addCompoundActions(CondtionAction it){
		if (compoundAction != null)
		'''		
		<compoundAction operator="«compoundAction.operator»">		
		«FOR sa: compoundAction.simpleAction»
			<simpleAction role="«sa.action»"/>
		«ENDFOR»
		</compoundAction>
		'''
	}
	
}