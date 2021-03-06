/*
 * generated by Xtext 2.9.1
 */
package ar.edu.unq.tvd.nclgenerator.ui.contentassist

import ar.edu.unq.tvd.nclgenerator.validation.DefaultData
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.RuleCall
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor

/**
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#content-assist
 * on how to customize the content assistant.
 */
class NCLGeneratorProposalProvider extends AbstractNCLGeneratorProposalProvider {
	
//	override complete_Region(EObject model, RuleCall ruleCall, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
//		var proposal = "region " + "name " + "{\n\n}"
//		acceptor.accept(createCompletionProposal(proposal, context));
//		super.complete_Region(model, ruleCall, context, acceptor)
//	}
	
	override complete_MediaProperty(EObject model, RuleCall ruleCall, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
		for(p : DefaultData.mediaPropertiesList){
			acceptor.accept(createCompletionProposal(p, context));
			super.complete_MediaProperty(model, ruleCall, context, acceptor)
		}
	}
	
	override complete_RegionProperty(EObject model, RuleCall ruleCall, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
		for(p : DefaultData.regionPropertiesList){
			acceptor.accept(createCompletionProposal(p, context))
		super.complete_RegionProperty(model, ruleCall, context, acceptor)
		}
	}
	
	override complete_Key(EObject model, RuleCall ruleCall, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
		for(p : DefaultData.buttonsList){
			acceptor.accept(createCompletionProposal(p, context))
			super.complete_Key(model, ruleCall, context, acceptor) 
		}
	}
	
}
