package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.ConditionAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.CompoundActionExtensions.*
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
		<connectorParam name="var"/>
		<compoundAction operator="«compoundAction.operator»">
			«FOR simpleAction: compoundAction.simpleActionsNames»
			«simpleAction.add»
			«ENDFOR»
		</compoundAction>
		'''
	}
	
	static def add(SimpleAction it){
		if (isSet) {
			'''
			<connectorParam name="var"/>
			<simpleAction role="set" value="$var"/>
			'''
		}
		else{
			'''
			<simpleAction role="«action»"/>
			'''
		}
	}
	
	static def add(String action){
		if (action == "set") {
			'''
			<simpleAction role="set" value="$var" max="unbounded"/>
			'''
		}
		else{
			'''
			<simpleAction role="«action»" max="unbounded"/>
			'''
		}
	}
}