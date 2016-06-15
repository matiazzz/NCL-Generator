package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media

class MediaExtensions {
	// Extensions methods for Media
	
	static def hasSource(Media it){
		!src.nullOrEmpty
	}
	
	static def addProperties(Media it){
		if(tieneProperties)
			'''
			«FOR p: properties»
			<property name="«p.name»" value="«p.value»"/>
			«ENDFOR»
			'''		
	}
	
	def static tieneProperties(Media it) {
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
	}
	
	static def hasRegion(Media it) {
		region != null
	}
}