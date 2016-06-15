package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Region

class RegionExtensions {
	// Extensions methods for Region
	
	static def addProperties(Region it){
		regionProperties.map[ p | p.name + '=' + '"' + p.value + '%"' + ' '].join
	}
	
	static def FirstUpperName(Region it){
		name.toFirstUpper
	}
}