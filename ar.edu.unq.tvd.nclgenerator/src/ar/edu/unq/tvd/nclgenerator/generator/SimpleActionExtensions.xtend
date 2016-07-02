package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.SimpleAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.MediaExtensions.*
class SimpleActionExtensions {
	
	
	static def addBind(SimpleAction it, Media media){
		var component = media.FirstUpperName
		if(it.media != null) component = it.media.FirstUpperName
		'''<bind role="«action»" component="«component»"/> '''
	}
}