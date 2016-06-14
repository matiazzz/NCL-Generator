package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Region

class RegionExtensions {
	// Extensions methods for Region
	
	static def addProperties(Region it){
		'''
		«FOR property: regionProperties»
		«property.name»=«property.value»%
		«ENDFOR»	
		'''
	}
}