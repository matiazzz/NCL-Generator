/*
 * generated by Xtext 2.9.1
 */
package ar.edu.unq.tvd.nclgenerator.ui.quickfix

import org.eclipse.xtext.ui.editor.quickfix.DefaultQuickfixProvider
import ar.edu.unq.tvd.nclgenerator.validation.NCLGeneratorValidator
import org.eclipse.xtext.validation.Issue
import org.eclipse.xtext.ui.editor.quickfix.IssueResolutionAcceptor
import org.eclipse.xtext.ui.editor.quickfix.Fix

/**
 * Custom quickfixes.
 *
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#quick-fixes
 */
class NCLGeneratorQuickfixProvider extends DefaultQuickfixProvider {

//	@Fix(NCLGeneratorValidator.INVALID_NAME)
//	def capitalizeName(Issue issue, IssueResolutionAcceptor acceptor) {
//		acceptor.accept(issue, 'Capitalize name', 'Capitalize the name.', 'upcase.png') [
//			context |
//			val xtextDocument = context.xtextDocument
//			val firstLetter = xtextDocument.get(issue.offset, 1)
//			xtextDocument.replace(issue.offset, 1, firstLetter.toUpperCase)
//		]
//	}
	
	@Fix(NCLGeneratorValidator.DUPLICATE_NAME)
	def changeDuplicateName(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(issue, 'Rename', 'Rename the name.', 'upcase.png') [
			context |
			val xtextDocument = context.xtextDocument
			val name = xtextDocument.get(issue.offset, issue.length)
			xtextDocument.replace(issue.offset, issue.length, name + "1")
		]
	}
		
}