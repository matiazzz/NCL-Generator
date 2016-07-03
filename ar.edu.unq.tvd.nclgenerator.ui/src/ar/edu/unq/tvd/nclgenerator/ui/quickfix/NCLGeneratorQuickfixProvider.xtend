/*
 * generated by Xtext 2.9.1
 */
package ar.edu.unq.tvd.nclgenerator.ui.quickfix

import ar.edu.unq.tvd.nclgenerator.nCLGenerator.Media
import ar.edu.unq.tvd.nclgenerator.nCLGenerator.NCLGeneratorFactory
import ar.edu.unq.tvd.nclgenerator.validation.NCLGeneratorValidator
import org.eclipse.xtext.diagnostics.Diagnostic
import org.eclipse.xtext.ui.editor.quickfix.DefaultQuickfixProvider
import org.eclipse.xtext.ui.editor.quickfix.Fix
import org.eclipse.xtext.ui.editor.quickfix.IssueResolutionAcceptor
import org.eclipse.xtext.validation.Issue

import static extension ar.edu.unq.tvd.nclgenerator.generator.MediaExtensions.*
import static extension org.eclipse.xtext.EcoreUtil2.*

/**
 * Custom quickfixes.
 *
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#quick-fixes
 */
class NCLGeneratorQuickfixProvider extends DefaultQuickfixProvider {

	@Fix(NCLGeneratorValidator.DUPLICATE_NAME)
	def changeDuplicateName(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(issue, 'Rename', 'Rename the region.', '') [
			context |
			val xtextDocument = context.xtextDocument
			val name = xtextDocument.get(issue.offset, issue.length)
			xtextDocument.replace(issue.offset, issue.length, name + "1")
		]
	}
	
	@Fix(Diagnostic.LINKING_DIAGNOSTIC)
	def createMissingRegion (Issue issue, IssueResolutionAcceptor acceptor){
		acceptor.accept(issue, 'Create missing region', 'Create missing region', '') [
			 
			element, context |
			val currentMedia = element.getContainerOfType(typeof(Media))
			val ncl = currentMedia.ncl
			ncl.regions.add(NCLGeneratorFactory.eINSTANCE.createRegion => [
					name = context.xtextDocument.get(issue.offset, issue.length)
			])
		]
	}
	
	@Fix(NCLGeneratorValidator.DUPLICATE_REGION_PROPERTY)
	def deleteDuplicateRegionProperty(Issue issue, IssueResolutionAcceptor acceptor){
		acceptor.accept(issue, 'Delete duplicate property', 'Delete duplicate property.', '') [
			context |
			val xtetxDocument = context.xtextDocument
			val line = xtetxDocument.getLineOfOffset(issue.offset)
			xtetxDocument.replace(issue.offset, xtetxDocument.getLineLength(line) -1, '')
		]
	}
}
