package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.NCL

class NCLExtensions {
	
	// Extensions methods for NCL
	static def filterMediasWithoutType(NCL it){
		medias.filter[m | m.type.nullOrEmpty]
	}
	
	//Extensions methods for Media
	static def hasSource(Media it){
		!src.nullOrEmpty
	}
	
	static def addProperties(Media it){
		if(!properties.empty)
			'''
			«FOR p: properties»
			<property name="«p.name»" value="«p.value»"/>
			«ENDFOR»
			'''		
	}
	
	static def addSrcOrType(Media it){
		if(hasSource)
			'''src="«src»" descriptor="descriptor«name»">'''
		else
			'''type="«type»">'''
	}
}