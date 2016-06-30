package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.NCL
import static extension ar.edu.unq.tvd.nclgenerator.generator.MediaExtensions.*

class NCLExtensions {
	// Extensions methods for NCL
	
	//static def filterMediasWithoutType(NCL it){
		//medias.filter[m | m.type.nullOrEmpty]
	//}
	
	static def hasRegions (NCL it){
		!regions.empty
	}
		
	static def mediasWithEvents (NCL it){
		medias.filter[m | m.hasEvents]
	}
	
}