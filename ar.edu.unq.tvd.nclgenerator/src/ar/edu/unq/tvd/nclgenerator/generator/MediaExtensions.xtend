package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.NCL
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.ConditionActionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.SimpleActionExtensions.*
import static extension ar.edu.unq.tvd.nclgenerator.generator.CompoundActionExtensions.*


class MediaExtensions {
	// Extensions methods for Media
	
	static def hasSource(Media it){
		!src.nullOrEmpty
	}
	
	static def addProperties(Media it){
		if(hasProperties)
		'''
		>
			«FOR p: properties»
			<property name="«p.name»" value="«p.value»"/>
			«ENDFOR»
		</media>
		'''
		else
			'''/>'''	
	}
	
	static def addRegionProperties(Media it){
		'''
		«FOR p: regionProperties»
			«p.name» = "«p.value»%"
		«ENDFOR»
		'''
	}
	
	def static hasProperties(Media it) {
		!properties.empty
	}
	
	static def addSrcOrType(Media it){
		if(hasSource)
			'''src="«src»"'''
		else
			'''type="«type»"'''
	}
	
	static def addDescriptor(Media it){
		if(hasRegion) '''descriptor="desc«region.name.toFirstUpper»"'''
		else '''descriptor="desc«name.toFirstUpper»"'''
	}
	
	static def hasRegion(Media it) {
		region != null
	}
	
	static def FirstUpperName(Media it){
		name.toFirstUpper
	}
	
	static def ncl(Media it) {eContainer as NCL}
	
	static def hasEvents(Media it){
		!(conditionActions.nullOrEmpty)
	}
	
	static def addCausalConnector(Media it){
		var id = 0
		'''
		«FOR ca: conditionActions»
			<causalConnector id="«name»«id++»">
				«ca.condition.addSimpleCondition»
				«ca.addSimpleAction»
				«ca.addCompoundActions»
			</causalConnector>
		«ENDFOR»
		'''
	}
	
	static def addLinks(Media it){
		var id = 0
		'''
		«FOR event : conditionActions»
			<link xconnector="«name»«id++»">
				<bind role="«event.condition.addRole»" component="«FirstUpperName»">
			    </bind>
			    «IF event.simpleAction != null»
			    «event.simpleAction.addBind(it)»
			    «ENDIF»
				«IF event.compoundAction != null»
				«event.compoundAction.addBinds(it)»
				«ENDIF»
			</link>
		«ENDFOR»
		'''
	}
	
}