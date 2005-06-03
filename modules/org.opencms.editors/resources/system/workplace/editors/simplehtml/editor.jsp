<%@ page import="
	org.opencms.workplace.*,
	org.opencms.workplace.editors.*,
	org.opencms.workplace.help.*,
	org.opencms.jsp.*,
	java.util.*"
	buffer="none"
%><%
	
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
CmsSimplePageEditor wp = new CmsSimplePageEditor(cms);
CmsEditorDisplayOptions options = wp.getEditorDisplayOptions();
Properties displayOptions = options.getDisplayOptions(cms);

int buttonStyle = wp.getSettings().getUserSettings().getEditorButtonStyle();

//////////////////// start of switch statement 
	
switch (wp.getAction()) {

case CmsSimplePageEditor.ACTION_SHOW_ERRORMESSAGE:
//////////////////// ACTION: display the common error dialog
	
	// do nothing here, only prevents editor content from being displayed!
	
break;
case CmsSimplePageEditor.ACTION_PREVIEW:
//////////////////// ACTION: preview the page

	wp.actionPreview();

break;
case CmsSimplePageEditor.ACTION_EXIT:
//////////////////// ACTION: exit the editor

	wp.actionExit();

break;
case CmsSimplePageEditor.ACTION_SAVEEXIT:
//////////////////// ACTION: save the modified content and exit the editor

	wp.actionSave();
	wp.actionExit();

break;
case CmsSimplePageEditor.ACTION_SAVE:
//////////////////// ACTION: save the modified content

	wp.actionSave();
	if (wp.getAction() == CmsSimpleEditor.ACTION_CANCEL) {
		// an error occured during save
		break;
	}

case CmsSimplePageEditor.ACTION_DEFAULT:
case CmsSimplePageEditor.ACTION_SHOW:
default:
//////////////////// ACTION: show editor frame (default)

	// escape the content and title parameters to display them in a form
	wp.escapeParams();
	
	%><%@ include file="mainpage.txt" %><%
	

}
%>