package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.SimpleAction
import static extension ar.edu.unq.tvd.nclgenerator.generator.MediaExtensions.*
class SimpleActionExtensions {
	
	
	static def addBind(SimpleAction it){
		'''<bind role="«action»" component="«media.FirstUpperName»"/> '''
	}
}