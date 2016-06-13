package ar.edu.unq.tvd.nclgenerator.generator

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.NCL
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Region
import org.eclipse.xtext.generator.IFileSystemAccess
import static extension ar.edu.unq.tvd.nclgenerator.generator.NCLExtensions.*

class NCLGenerator {
	
	protected NCL ncl
	
	def generateNCL(IFileSystemAccess fsa, NCL ncl) {
		this.ncl = ncl
		fsa.generateFile(ncl.name + '.ncl', generate)
	}
	
	def generate(){
		'''
		<ncl id=«ncl.name» xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
		    <head>
		    	<regionBase>
		    		«generateRegions»
		    	</regionBase>
		        
		        <descriptorBase>
		        	«generateDescriptors»
		        </descriptorBase>
		        
		    </head>
		
		    <body>
		        «generatePorts»
		        «generateMedias»
		    </body>
		</ncl>
		'''
	}
	
	def generateMedias() {
		'''
		«FOR m: ncl.medias»
		<media id="«m.name»" «m.addSrcOrType»
			«m.addProperties»
		</media>
		«ENDFOR»
		'''
	}
	
	def generatePorts() {
		//TODO
		'''
		«FOR m: ncl.filterMediasWithoutType»
		<port id="port«m.name.toFirstUpper»" component="«m.name.toFirstUpper»"/> 
		«ENDFOR»
		'''
	}
	
	def generateRegions() {
		'''
		«FOR m: ncl.filterMediasWithoutType»
		<region id="reg«m.name.toFirstUpper»" «addRegion(m.region)»
		«ENDFOR»	
		'''
	}
	
	def addRegion(Region region){
		'''
		width="«region.width»%" height="«region.heigth»%" top="«region.top»%" down="«region.down»%" zIndex="«region.ZIndex»"/>
		'''
	}
	
	def generateDescriptors() {
		'''
		«FOR m: ncl.filterMediasWithoutType»
		<descriptor id="desc«m.name.toFirstUpper»" region="reg«m.name.toFirstUpper»"/>
		«ENDFOR»		
		'''
	}
	
}