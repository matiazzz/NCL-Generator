package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.NCL

class NCLExtensions {
	// Extensions methods for NCL
	
	//static def filterMediasWithoutType(NCL it){
		//medias.filter[m | m.type.nullOrEmpty]
	//}
	
	static def hasRegions (NCL it){
		!regions.empty
	}
	
	static def hasEvents (NCL it){
		!events.empty
	}
	
}