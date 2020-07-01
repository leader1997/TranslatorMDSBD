package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.cloud.sdk.core.security.Authenticator;
import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.discovery.v1.model.CreateCollectionOptions.Language;
import com.ibm.watson.language_translator.v3.LanguageTranslator;
import com.ibm.watson.language_translator.v3.model.TranslateOptions;
import com.ibm.watson.language_translator.v3.model.TranslationResult;

/**
 * Servlet implementation class translate
 */
@WebServlet("/translate")
public class translate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public translate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String textInput=request.getParameter("txtIn");
		String textOutput=request.getParameter("txtOut");
		String LangueInput=request.getParameter("in");
		String LangueOutput=request.getParameter("out");
		
		System.out.println(textInput+"\n");
		System.out.println(textOutput+"\n");
		System.out.println(LangueInput+"\n");
		
		String xInput;
		
		switch(LangueInput) {
		case "english":
			xInput=Language.EN;
			break;
			
		/*case "arabic":
			xInput=Language.AR;
			break;
			*/
		case "french":
			xInput=Language.FR;
			break;
		
		case "espagnol":
			xInput=Language.ES;
			break;
			
		default :
			xInput=Language.FR;
		}
		
		String xOutput;
		
		switch(LangueOutput) {
		case "english":
			xOutput=Language.EN;
			break;
			
		/*case "arabic":
			xOutput=Language.;
			break;
			*/
		case "french":
			xOutput=Language.FR;
			break;
		
		case "espagnol":
			xOutput=Language.ES;
			break;
			
		default :
			xOutput=Language.EN;
		}
		
		IamAuthenticator authenticator = new IamAuthenticator("YLX0twvbk-FXZIQ8pF_bU4rYi3jrjOHZIax4OzrgkaMM");
		LanguageTranslator languageTranslator = new LanguageTranslator("2018-05-01", authenticator);
		languageTranslator.setServiceUrl("https://api.eu-gb.language-translator.watson.cloud.ibm.com/instances/c18aace2-9e88-4d29-a962-916062b7dd2d");
		
		TranslateOptions translateOptions = new TranslateOptions.Builder().addText(textInput).source(xInput).target(xOutput).build();
		TranslationResult translationResult = languageTranslator.translate(translateOptions).execute().getResult();
		
		System.out.println(translationResult.getTranslations().get(0).getTranslation());
		
		request.setAttribute("result", translationResult.getTranslations().get(0).getTranslation());
		request.setAttribute("resultOf",textInput);
		request.setAttribute("Lin",LangueInput);
		request.setAttribute("Lout",LangueOutput);
		
		
		System.out.println("servlet: "+request.getAttribute("result"));
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
