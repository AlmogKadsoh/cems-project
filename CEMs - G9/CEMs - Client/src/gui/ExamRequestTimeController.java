package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

/**
 * A class that represents professor's time extension request.
 */
public class ExamRequestTimeController implements Initializable
{
	private String hofId = "";
	
	private static ArrayList<String> sArr;
	
	private static User u;
	
    @FXML
    private Button SubmitBtn;

    @FXML
    private TextField examName;

    @FXML
    private TextArea reason;

    @FXML
    private TextField timeToAdd;

    @FXML
    private Text welcomeText;
    
    @FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;

    /**
   	 * Initializes the JavaFX controller during application startup.
   	 * @param user
   	 * @param array
   	 * @throws Exception
   	 */
    public static void start(ArrayList<String> array, User user) throws  Exception
    {
    	sArr = array;
    	u = user;
    	Platform.runLater(()->ScreenUtils.createNewStage("/gui/ExamRequestTime.fxml").show());
    }
    
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setExamRequestTimeController(this);
		//Sets exam name.
		examName.setText(sArr.get(1));
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
	}
	
	/**
	 * Exits from client GUI - disconnects from DB aswell.
	 * 
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(u);
	}

    /**
	 * Goes back to exam bank screen.
	 * @param event
	 */
    @FXML
    void goBack(ActionEvent event) 
    {
    	UserController.goBack(event, "/gui/ExamBankScreen.fxml");
    }

    /**
     * Sends the request to the HOF.
     * @param event
     */
    @FXML
    void sendRequest(ActionEvent event) 
    {
    	HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Time Change");
		    return;
		}
		ArrayList<String> request = new ArrayList<>();
		request.add("get head of dep id");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
		request = constructRequest();
		ClientUI.chat.accept(request);
		UserController.goBack(event, "/gui/ExamBankScreen.fxml");
    }

    /**
     * Constructs the request.
     */
    private ArrayList<String> constructRequest()
    {
    	ArrayList<String> request = new ArrayList<>();
		request.add("request to add time");
		request.add(sArr.get(0));
		request.add(timeToAdd.getText());
		request.add("0");
		request.add(u.getUser_id());
		request.add(u.get_fullName());
		request.add(reason.getText());
		request.add(sArr.get(1));
		request.add(hofId);
		return request;
    }
    
	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap() 
	{
	    HashMap<Boolean, String> errorMap = new HashMap<>();
	    boolean isWrongTime = false;
	    try 
	    {
	    	Integer.parseInt(timeToAdd.getText());
	    	if(Integer.parseInt(timeToAdd.getText()) < 1) isWrongTime = true;
	    } 
	    catch (NumberFormatException e){isWrongTime = true;}
	    errorMap.put(reason.getText().isEmpty(), "A reason is required.");
	    errorMap.put(isWrongTime, "Changed time must be a positive integer.");
	    errorMap.put(timeToAdd.getText().isEmpty(), "Time to add is required.");
	    return errorMap;
	}
	
	/**
	 * Setter.
	 */
	public void setHeadofDepId(String hofId)
	{
		this.hofId = hofId;
	}
}
