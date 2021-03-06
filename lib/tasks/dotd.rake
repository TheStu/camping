task :send_newsletter => :environment do
	
	gb = Gibbon::API.new

	response = gb.campaigns.create({
		type: 'regular',
		options: {
			list_id: '038630fc36',
			subject: "Camping Gear Deals for #{Date.today.strftime('%A')}",
			from_email: 'admin@tenpoundbackpack.com',
			from_name: 'TenPoundBackpack',
			title: "subscriber_newsletter_#{Date.today.strftime('%Y_%m_%d')}",
			authenticate: true,
			analytics: {
				google: "subscriber_newsletter_#{Date.today.strftime('%Y_%m_%d')}"
			}
		},
		content: {
			html: generate_html_content
		}
	})

	gb.campaigns.send({cid: response['id']})

end

def generate_html_content

	# rei = REI
	# bc = BACKCOUNTRY
	# pat = PATAGONIA
	# stp = SIERRA TRADING POST
	# ems = EASTERN MOUNTAIN SPORTS
	# mg = MOUNTAIN GEAR
	# ll = LEFTLANE
	# rc =  ROCKCREEK

	require 'nokogiri'
	require 'open-uri'

	include ActionView::Helpers::TextHelper

	rei = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=16&affiliate_id=31645&merchant_id=10248&website_id=41369&custom_tracking_code=&output=xml"))
	bc = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=6&affiliate_id=31645&merchant_id=10060&website_id=41369&custom_tracking_code=&output=xml"))
	pat = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=33&affiliate_id=31645&merchant_id=10083&website_id=41369&custom_tracking_code=&output=xml"))
	gx = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=141&affiliate_id=31645&merchant_id=10537&website_id=41369&custom_tracking_code=&output=xml"))
	ems = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=237&affiliate_id=31645&merchant_id=10785&website_id=41369&custom_tracking_code=&output=xml"))
	mg = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=513&affiliate_id=31645&merchant_id=11419&website_id=41369&custom_tracking_code=&output=xml"))
	ll = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=213&affiliate_id=31645&merchant_id=10965&website_id=41369&custom_tracking_code=&output=xml"))
	rc = Nokogiri::XML(open("https://classic.avantlink.com/api.php?module=DotdFeed&dotd_id=63&affiliate_id=31645&merchant_id=10049&website_id=41369&custom_tracking_code=&output=xml"))

	email = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
    <head>
    	<!-- NAME: 1:2 COLUMN - BANDED -->
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <title>*|MC:SUBJECT|*</title>
        
    <style type=\"text/css\">
		body,#bodyTable,#bodyCell{
			height:100% !important;
			margin:0;
			padding:0;
			width:100% !important;
		}
		table{
			border-collapse:collapse;
		}
		img,a img{
			border:0;
			outline:none;
			text-decoration:none;
		}
		h1,h2,h3,h4,h5,h6{
			margin:0;
			padding:0;
		}
		p{
			margin:1em 0;
			padding:0;
		}
		a{
			word-wrap:break-word;
		}
		.ReadMsgBody{
			width:100%;
		}
		.ExternalClass{
			width:100%;
		}
		.ExternalClass,.ExternalClass p,.ExternalClass span,.ExternalClass font,.ExternalClass td,.ExternalClass div{
			line-height:100%;
		}
		table,td{
			mso-table-lspace:0pt;
			mso-table-rspace:0pt;
		}
		#outlook a{
			padding:0;
		}
		img{
			-ms-interpolation-mode:bicubic;
		}
		body,table,td,p,a,li,blockquote{
			-ms-text-size-adjust:100%;
			-webkit-text-size-adjust:100%;
		}
		#bodyCell{
			padding:0;
		}
		.mcnImage{
			vertical-align:bottom;
		}
		.mcnTextContent img{
			height:auto !important;
		}
	/*
	@tab Page
	@section background style
	@tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.
	*/
		body,#bodyTable{
			/*@editable*/background-color:#F2F2F2;
		}
	/*
	@tab Page
	@section background style
	@tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.
	*/
		#bodyCell{
			/*@editable*/border-top:0;
		}
	/*
	@tab Page
	@section heading 1
	@tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.
	@style heading 1
	*/
		h1{
			/*@editable*/color:#606060 !important;
			display:block;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:40px;
			/*@editable*/font-style:normal;
			/*@editable*/font-weight:bold;
			/*@editable*/line-height:125%;
			/*@editable*/letter-spacing:-1px;
			margin:0;
			/*@editable*/text-align:left;
		}
	/*
	@tab Page
	@section heading 2
	@tip Set the styling for all second-level headings in your emails.
	@style heading 2
	*/
		h2{
			/*@editable*/color:#404040 !important;
			display:block;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:26px;
			/*@editable*/font-style:normal;
			/*@editable*/font-weight:bold;
			/*@editable*/line-height:125%;
			/*@editable*/letter-spacing:-.75px;
			margin:0;
			/*@editable*/text-align:left;
		}
	/*
	@tab Page
	@section heading 3
	@tip Set the styling for all third-level headings in your emails.
	@style heading 3
	*/
		h3{
			/*@editable*/color:#606060 !important;
			display:block;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:18px;
			/*@editable*/font-style:normal;
			/*@editable*/font-weight:bold;
			/*@editable*/line-height:125%;
			/*@editable*/letter-spacing:-.5px;
			margin:0;
			/*@editable*/text-align:left;
		}
	/*
	@tab Page
	@section heading 4
	@tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.
	@style heading 4
	*/
		h4{
			/*@editable*/color:#808080 !important;
			display:block;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:16px;
			/*@editable*/font-style:normal;
			/*@editable*/font-weight:bold;
			/*@editable*/line-height:125%;
			/*@editable*/letter-spacing:normal;
			margin:0;
			/*@editable*/text-align:left;
		}
	/*
	@tab Preheader
	@section preheader style
	@tip Set the background color and borders for your email's preheader area.
	*/
		#templatePreheader{
			/*@editable*/background-color:#FFFFFF;
			/*@editable*/border-top:0;
			/*@editable*/border-bottom:0;
		}
	/*
	@tab Preheader
	@section preheader text
	@tip Set the styling for your email's preheader text. Choose a size and color that is easy to read.
	*/
		.preheaderContainer .mcnTextContent,.preheaderContainer .mcnTextContent p{
			/*@editable*/color:#606060;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:11px;
			/*@editable*/line-height:125%;
			/*@editable*/text-align:left;
		}
	/*
	@tab Preheader
	@section preheader link
	@tip Set the styling for your email's header links. Choose a color that helps them stand out from your text.
	*/
		.preheaderContainer .mcnTextContent a{
			/*@editable*/color:#606060;
			/*@editable*/font-weight:normal;
			/*@editable*/text-decoration:underline;
		}
	/*
	@tab Header
	@section header style
	@tip Set the background color and borders for your email's header area.
	*/
		#templateHeader{
			/*@editable*/background-color:#FFFFFF;
			/*@editable*/border-top:0;
			/*@editable*/border-bottom:0;
		}
	/*
	@tab Header
	@section header text
	@tip Set the styling for your email's header text. Choose a size and color that is easy to read.
	*/
		.headerContainer .mcnTextContent,.headerContainer .mcnTextContent p{
			/*@editable*/color:#606060;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:15px;
			/*@editable*/line-height:150%;
			/*@editable*/text-align:left;
		}
	/*
	@tab Header
	@section header link
	@tip Set the styling for your email's header links. Choose a color that helps them stand out from your text.
	*/
		.headerContainer .mcnTextContent a{
			/*@editable*/color:#6DC6DD;
			/*@editable*/font-weight:normal;
			/*@editable*/text-decoration:underline;
		}
	/*
	@tab Body
	@section body style
	@tip Set the background color and borders for your email's body area.
	*/
		#templateBody{
			/*@editable*/background-color:#FFFFFF;
			/*@editable*/border-top:0;
			/*@editable*/border-bottom:0;
		}
	/*
	@tab Body
	@section body text
	@tip Set the styling for your email's body text. Choose a size and color that is easy to read.
	*/
		.bodyContainer .mcnTextContent,.bodyContainer .mcnTextContent p{
			/*@editable*/color:#606060;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:15px;
			/*@editable*/line-height:150%;
			/*@editable*/text-align:left;
		}
	/*
	@tab Body
	@section body link
	@tip Set the styling for your email's body links. Choose a color that helps them stand out from your text.
	*/
		.bodyContainer .mcnTextContent a{
			/*@editable*/color:#6DC6DD;
			/*@editable*/font-weight:normal;
			/*@editable*/text-decoration:underline;
		}
	/*
	@tab Columns
	@section column style
	@tip Set the background color and borders for your email's columns area.
	*/
		#templateColumns{
			/*@editable*/background-color:#FFFFFF;
			/*@editable*/border-top:0;
			/*@editable*/border-bottom:0;
		}
	/*
	@tab Columns
	@section left column text
	@tip Set the styling for your email's left column text. Choose a size and color that is easy to read.
	*/
		.leftColumnContainer .mcnTextContent,.leftColumnContainer .mcnTextContent p{
			/*@editable*/color:#606060;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:15px;
			/*@editable*/line-height:150%;
			/*@editable*/text-align:left;
		}
	/*
	@tab Columns
	@section left column link
	@tip Set the styling for your email's left column links. Choose a color that helps them stand out from your text.
	*/
		.leftColumnContainer .mcnTextContent a{
			/*@editable*/color:#6DC6DD;
			/*@editable*/font-weight:normal;
			/*@editable*/text-decoration:underline;
		}
	/*
	@tab Columns
	@section right column text
	@tip Set the styling for your email's right column text. Choose a size and color that is easy to read.
	*/
		.rightColumnContainer .mcnTextContent,.rightColumnContainer .mcnTextContent p{
			/*@editable*/color:#606060;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:15px;
			/*@editable*/line-height:150%;
			/*@editable*/text-align:left;
		}
	/*
	@tab Columns
	@section right column link
	@tip Set the styling for your email's right column links. Choose a color that helps them stand out from your text.
	*/
		.rightColumnContainer .mcnTextContent a{
			/*@editable*/color:#6DC6DD;
			/*@editable*/font-weight:normal;
			/*@editable*/text-decoration:underline;
		}
	/*
	@tab Footer
	@section footer style
	@tip Set the background color and borders for your email's footer area.
	*/
		#templateFooter{
			/*@editable*/background-color:#F2F2F2;
			/*@editable*/border-top:0;
			/*@editable*/border-bottom:0;
		}
	/*
	@tab Footer
	@section footer text
	@tip Set the styling for your email's footer text. Choose a size and color that is easy to read.
	*/
		.footerContainer .mcnTextContent,.footerContainer .mcnTextContent p{
			/*@editable*/color:#606060;
			/*@editable*/font-family:Helvetica;
			/*@editable*/font-size:11px;
			/*@editable*/line-height:125%;
			/*@editable*/text-align:left;
		}
	/*
	@tab Footer
	@section footer link
	@tip Set the styling for your email's footer links. Choose a color that helps them stand out from your text.
	*/
		.footerContainer .mcnTextContent a{
			/*@editable*/color:#606060;
			/*@editable*/font-weight:normal;
			/*@editable*/text-decoration:underline;
		}
	@media only screen and (max-width: 480px){
		body,table,td,p,a,li,blockquote{
			-webkit-text-size-adjust:none !important;
		}

}	@media only screen and (max-width: 480px){
		body{
			width:100% !important;
			min-width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcnTextContentContainer]{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcnBoxedTextContentContainer]{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcpreview-image-uploader]{
			width:100% !important;
			display:none !important;
		}

}	@media only screen and (max-width: 480px){
		img[class=mcnImage]{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcnImageGroupContentContainer]{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageGroupContent]{
			padding:9px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageGroupBlockInner]{
			padding-bottom:0 !important;
			padding-top:0 !important;
		}

}	@media only screen and (max-width: 480px){
		tbody[class=mcnImageGroupBlockOuter]{
			padding-bottom:9px !important;
			padding-top:9px !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcnCaptionTopContent],table[class=mcnCaptionBottomContent]{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcnCaptionLeftTextContentContainer],table[class=mcnCaptionRightTextContentContainer],table[class=mcnCaptionLeftImageContentContainer],table[class=mcnCaptionRightImageContentContainer],table[class=mcnImageCardLeftTextContentContainer],table[class=mcnImageCardRightTextContentContainer]{
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageCardLeftImageContent],td[class=mcnImageCardRightImageContent]{
			padding-right:18px !important;
			padding-left:18px !important;
			padding-bottom:0 !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageCardBottomImageContent]{
			padding-bottom:9px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageCardTopImageContent]{
			padding-top:18px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageCardLeftImageContent],td[class=mcnImageCardRightImageContent]{
			padding-right:18px !important;
			padding-left:18px !important;
			padding-bottom:0 !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageCardBottomImageContent]{
			padding-bottom:9px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnImageCardTopImageContent]{
			padding-top:18px !important;
		}

}	@media only screen and (max-width: 480px){
		table[class=mcnCaptionLeftContentOuter] td[class=mcnTextContent],table[class=mcnCaptionRightContentOuter] td[class=mcnTextContent]{
			padding-top:9px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnCaptionBlockInner] table[class=mcnCaptionTopContent]:last-child td[class=mcnTextContent]{
			padding-top:18px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnBoxedTextContentColumn]{
			padding-left:18px !important;
			padding-right:18px !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=columnsContainer]{
			display:block !important;
			max-width:600px !important;
			width:100% !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=mcnTextContent]{
			padding-right:18px !important;
			padding-left:18px !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section template width
	@tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesn't work for you, set the width to 300px instead.
	*/
		table[class=templateContainer],table[id=templateColumns],table[class=templateColumn]{
			/*@tab Mobile Styles
@section template width
@tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesn't work for you, set the width to 300px instead.*/max-width:600px !important;
			/*@editable*/width:100% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section heading 1
	@tip Make the first-level headings larger in size for better readability on small screens.
	*/
		h1{
			/*@editable*/font-size:24px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section heading 2
	@tip Make the second-level headings larger in size for better readability on small screens.
	*/
		h2{
			/*@editable*/font-size:20px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section heading 3
	@tip Make the third-level headings larger in size for better readability on small screens.
	*/
		h3{
			/*@editable*/font-size:18px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section heading 4
	@tip Make the fourth-level headings larger in size for better readability on small screens.
	*/
		h4{
			/*@editable*/font-size:16px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Boxed Text
	@tip Make the boxed text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/
		table[class=mcnBoxedTextContentContainer] td[class=mcnTextContent],td[class=mcnBoxedTextContentContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:18px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Preheader Visibility
	@tip Set the visibility of the email's preheader on small screens. You can hide it to save space.
	*/
		table[id=templatePreheader]{
			/*@editable*/display:block !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Preheader Text
	@tip Make the preheader text larger in size for better readability on small screens.
	*/
		td[class=preheaderContainer] td[class=mcnTextContent],td[class=preheaderContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:14px !important;
			/*@editable*/line-height:115% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Header Text
	@tip Make the header text larger in size for better readability on small screens.
	*/
		td[class=headerContainer] td[class=mcnTextContent],td[class=headerContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:18px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Body Text
	@tip Make the body text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/
		td[class=bodyContainer] td[class=mcnTextContent],td[class=bodyContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:18px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Left Column Text
	@tip Make the left column text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/
		td[class=leftColumnContainer] td[class=mcnTextContent],td[class=leftColumnContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:18px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section Right Column Text
	@tip Make the right column text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/
		td[class=rightColumnContainer] td[class=mcnTextContent],td[class=rightColumnContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:18px !important;
			/*@editable*/line-height:125% !important;
		}

}	@media only screen and (max-width: 480px){
	/*
	@tab Mobile Styles
	@section footer text
	@tip Make the body content text larger in size for better readability on small screens.
	*/
		td[class=footerContainer] td[class=mcnTextContent],td[class=footerContainer] td[class=mcnTextContent] p{
			/*@editable*/font-size:14px !important;
			/*@editable*/line-height:115% !important;
		}

}	@media only screen and (max-width: 480px){
		td[class=footerContainer] a[class=utilityLink]{
			display:block !important;
		}

}</style></head>
    <body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">
        <center>
            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"bodyTable\">
                <tr>
                    <td align=\"center\" valign=\"top\" id=\"bodyCell\">
                        <!-- BEGIN TEMPLATE // -->
                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
                            <tr>
                                <td align=\"center\" valign=\"top\">
                                    <!-- BEGIN PREHEADER // -->
                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templatePreheader\">
                                        <tr>
                                        	<td align=\"center\" valign=\"top\">
                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" class=\"templateContainer\">
                                                    <tr>
                                                        <td valign=\"top\" class=\"preheaderContainer\" style=\"padding-top:9px;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\">
    <tbody class=\"mcnTextBlockOuter\">
        <tr>
            <td valign=\"top\" class=\"mcnTextBlockInner\">
                
                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"366\" class=\"mcnTextContentContainer\">
                    <tbody><tr>
                        
                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:9px; padding-left:18px; padding-bottom:9px; padding-right:0;\">
                        
                            The best deals on the best camping and hiking gear
                        </td>
                    </tr>
                </tbody></table>
                
                <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"197\" class=\"mcnTextContentContainer\">
                    <tbody><tr>
                        
                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:9px; padding-right:18px; padding-bottom:9px; padding-left:0;\">
                        
                            <a href=\"*|ARCHIVE|*\" target=\"_blank\">View this email in your browser</a>
                        </td>
                    </tr>
                </tbody></table>
                
            </td>
        </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                            </td>                                            
                                        </tr>
                                    </table>
                                    <!-- // END PREHEADER -->
                                </td>
                            </tr>
                            <tr>
                                <td align=\"center\" valign=\"top\">
                                    <!-- BEGIN HEADER // -->
                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateHeader\">
                                        <tr>
                                            <td align=\"center\" valign=\"top\">
                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" class=\"templateContainer\">
                                                    <tr>
                                                        <td valign=\"top\" class=\"headerContainer\" style=\"padding-top:10px; padding-bottom:10px;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnImageBlock\">
    <tbody class=\"mcnImageBlockOuter\">
            <tr>
                <td valign=\"top\" style=\"padding:9px\" class=\"mcnImageBlockInner\">
                    <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\">
                        <tbody><tr>
                            <td class=\"mcnImageContent\" valign=\"top\" style=\"padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0; text-align:center;\">
                                
                                    
                                        <img align=\"center\" alt=\"\" src=\"https://gallery.mailchimp.com/c41f921ac1d23d7ddeb222cb0/images/4dee712b-4263-4114-b4ea-306d007d1a81.png\" width=\"191\" style=\"max-width:191px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" class=\"mcnImage\">
                                    
                                
                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- // END HEADER -->
                                </td>
                            </tr>
                            <tr>
                                <td align=\"center\" valign=\"top\">
                                    <!-- BEGIN BODY // -->
                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateBody\">
                                        <tr>
                                            <td align=\"center\" valign=\"top\">
                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" class=\"templateContainer\">
                                                    <tr>
                                                        <td valign=\"top\" class=\"bodyContainer\" style=\"padding-top:10px; padding-bottom:10px;\"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- // END BODY -->
                                </td>
                            </tr>
                            <tr>
                                <td align=\"center\" valign=\"top\">
                                    <!-- BEGIN COLUMNS // -->
                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateColumns\">
                                        <tr>
                                            <td align=\"center\" valign=\"top\">
                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" class=\"templateContainer\">
                                                    <tr>
                                                        <td align=\"left\" valign=\"top\" class=\"columnsContainer\" width=\"50%\">
                                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"templateColumn\">
                                                                <tr>
                                                                    <td valign=\"top\" class=\"leftColumnContainer\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{rei.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{rei.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"text-align: center;\"><a href=\"#{rei.xpath('//Buy_URL').text}\" target=\"_blank\">#{rei.xpath('//Product_Name').text}</a></h3>
#{truncate(rei.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{rei.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color:#808080\"><span style=\"font-size:10px\">from #{rei.xpath('//Merchant_Name').text}</span></span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{bc.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{bc.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{bc.xpath('//Buy_URL').text}\" target=\"_blank\">#{bc.xpath('//Product_Name').text}</a></h3>
#{truncate(bc.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{bc.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{bc.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{pat.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{pat.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{pat.xpath('//Buy_URL').text}\" target=\"_blank\">#{pat.xpath('//Product_Name').text}</a></h3>
#{truncate(pat.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{pat.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{pat.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{gx.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{gx.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{gx.xpath('//Buy_URL').text}\" target=\"_blank\">#{gx.xpath('//Product_Name').text}</a></h3>
#{truncate(gx.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{gx.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{gx.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align=\"left\" valign=\"top\" class=\"columnsContainer\" width=\"50%\">
                                                            <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"templateColumn\">
                                                                <tr>
                                                                    <td valign=\"top\" class=\"rightColumnContainer\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{ems.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{ems.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{ems.xpath('//Buy_URL').text}\" target=\"_blank\">#{ems.xpath('//Product_Name').text}</a></h3>
#{truncate(ems.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{ems.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{ems.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{mg.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{mg.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{mg.xpath('//Buy_URL').text}\" target=\"_blank\">#{mg.xpath('//Product_Name').text}</a></h3>
#{truncate(mg.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{mg.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{mg.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{ll.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{ll.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{ll.xpath('//Buy_URL').text}\" target=\"_blank\">#{ll.xpath('//Product_Name').text}</a></h3>
#{truncate(ll.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{ll.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{ll.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnCaptionBlock\">
    <tbody class=\"mcnCaptionBlockOuter\">
        <tr>
            <td class=\"mcnCaptionBlockInner\" valign=\"top\" style=\"padding:9px;\">
                

<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnCaptionBottomContent\" width=\"false\">
    <tbody><tr>
        <td class=\"mcnCaptionBottomImageContent\" align=\"center\" valign=\"top\" style=\"padding:0 9px 9px 9px;\">
        
            
            <a href=\"#{rc.xpath('//Buy_URL').text}\" title=\"\" class=\"\" target=\"_blank\">
            

            <img alt=\"\" src=\"#{rc.xpath('//Large_Image_URL').text}\" width=\"200\" style=\"max-width:200px;\" class=\"mcnImage\">
            </a>
        
        </td>
    </tr>
    <tr>
        <td class=\"mcnTextContent\" valign=\"top\" style=\"padding:0 9px 0 9px;\" width=\"264\">
            <h3 style=\"line-height: 20.7999992370605px; text-align: center;\"><a href=\"#{rc.xpath('//Buy_URL').text}\" target=\"_blank\">#{rc.xpath('//Product_Name').text}</a></h3>
#{truncate(rc.xpath('//Long_Description').text, length: 150)}

<div style=\"text-align: center; margin-top:5px\"><strong><span style=\"color:#FFFFFF\"><span style=\"background-color:#FF0000; padding:5px 10px\">-#{rc.xpath('//Percent_Off').text}%</span></span></strong></div>

<div style=\"text-align: center;\"><span style=\"color: #808080;font-size: 10px;line-height: 20.7999992370605px;text-align: center;\">from #{rc.xpath('//Merchant_Name').text}</span></div>

        </td>
    </tr>
</tbody></table>





            </td>
        </tr>
    </tbody>
</table></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- // END COLUMNS -->
                                </td>
                            </tr>
                            <tr>
                                <td align=\"center\" valign=\"top\">
                                                                        <!-- BEGIN FOOTER // -->
                                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateFooter\">
                                                                            <tr>
                                                                                <td valign=\"top\" class=\"footerContainer\" style=\"padding-bottom:9px;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\">
                                        <tbody class=\"mcnTextBlockOuter\">
                                            <tr>
                                                <td valign=\"top\" class=\"mcnTextBlockInner\">
                                                    
                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" class=\"mcnTextContentContainer\">
                                                        <tbody><tr>
                                                            
                                                            <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;\">
                                                            
                                                                <em>Copyright © *|CURRENT_YEAR|* *|LIST:COMPANY|*, All rights reserved.</em>
                                    <br>
                                    *|IFNOT:ARCHIVE_PAGE|*
                                        *|LIST:DESCRIPTION|*
                                        <br>
                                        <br>
                                        <strong>Our mailing address is:</strong>
                                        <br>
                                        *|HTML:LIST_ADDRESS_HTML|* *|END:IF|*
                                        <br>
                                        <br>
                                    	Want to change how you receive these emails?<br>
                                        You can <a href=\"*|UPDATE_PROFILE|*\">update your preferences</a> or <a href=\"*|UNSUB|*\">unsubscribe from this list</a>
                                        <br>
                                        <br>
                                        *|IF:REWARDS|* *|HTML:REWARDS|*
                                    *|END:IF|*
                                                            </td>
                                                        </tr>
                                                    </tbody></table>
                                                    
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table></td>
                                                                            </tr>
                                                                        </table>
                                                                        <!-- // END FOOTER -->
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <!-- // END TEMPLATE -->
                                                        </td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </body>
                                    </html>
"

return email

end

