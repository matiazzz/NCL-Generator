package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnSelection
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Condition
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnAction

class ConditionExtensions {
	
	static def dispatch addSimpleCondition(Condition it){}
	static def dispatch addSimpleCondition(OnSelection it){
		'''
		<simpleCondition role="onSelection" key="«key.name»"/>
		'''
	}
	static def dispatch addSimpleCondition(OnAction it){'''<simpleCondition role="«condition»"/>'''}
	
	static def dispatch addRole(Condition it){}
	static def dispatch addRole(OnSelection it){'''onSelection'''}
	static def dispatch addRole(OnAction it){'''«condition»'''}
}