package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Event
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionActionExtensions.*

class EventExtensions {
	
	static def addCausalConnector(Event it){
		'''
		«FOR ca: conditionAction»
		<causalConnector id="NombreDelEvento">
				<connectorParam name=""/>
			    «ca.addSimpleCondition»
			    «ca.addSimpleAction»
			    «ca.addCompoundActions»
		</causalConnector>
		«ENDFOR»
		'''
	}
	
}