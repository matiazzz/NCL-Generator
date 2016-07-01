package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnSelection
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnStart
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnStop
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Condition

class ConditionExtensions {
	static def dispatch addSimpleCondition(OnSelection it){
	'''
	<simpleCondition role="onSelection" key="«key»"/>
	'''}
	
	static def dispatch addSimpleCondition(OnStart it){'''<simpleCondition role="onStart"/>'''}
	
	static def dispatch addSimpleCondition(OnStop it){'''<simpleCondition role="onStop"/>'''}
	
	static def dispatch addSimpleCondition(Condition it){}
	
	
	static def dispatch addRole(OnSelection it){'''onSelection'''}
	
	static def dispatch addRole(OnStart it){'''onStart'''}
	
	static def dispatch addRole(OnStop it){'''onStop'''}
	
	static def dispatch addRole(Condition it){}
	
}