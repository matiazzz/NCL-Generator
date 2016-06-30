package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnSelection
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnStart
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.OnStop
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Condition

class ConditionExtensions {
	static def dispatch addSimpleCondition(OnSelection it){'''<simpleCondition role="onSelection" key="$key"/>'''}
	
	static def dispatch addSimpleCondition(OnStart it){'''<simpleCondition role="onStart" key="$key"/>'''}
	
	static def dispatch addSimpleCondition(OnStop it){'''<simpleCondition role="onStop" key="$key"/>'''}
	
	static def dispatch addSimpleCondition(Condition it){}
}