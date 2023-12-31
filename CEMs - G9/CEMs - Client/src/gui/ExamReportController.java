package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.ExamTemplate;
import entities.Professor;
import entities.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;

/**
 * Class that lets the professor view his exam statistics.
 */
public class ExamReportController implements Initializable
{
	private static ReportScreenController reportScreen = new ReportScreenController();
	
	public static Map<String, ArrayList<String>> teachingMap;
	
    private static User u;
    
    private static ArrayList<?> arr;
    
    @FXML
    private TableColumn<ExamTemplate, String> examIdCol;

    @FXML
    private TableColumn<ExamTemplate, String> examNameCol;

    @FXML
    private TableColumn<ExamTemplate,String> examCourseCol;
    
    @FXML
    private TableView<ExamTemplate> examTable;

    @FXML
    private Button exitBtn;

    @FXML
    private ImageView exitImage;

    @FXML
    private ImageView faceImage;

    @FXML
    private Button goBackBtn;

    @FXML
    private ImageView labelImage;

    @FXML
    private ImageView returnIm;

    @FXML
    private TextField searchBar;

    @FXML
    private Button viewReport;

    @FXML
    private Text welcomeText;
    
    @FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;
    
    private Object itemChosen;
    
    private static ActionEvent currentEvent;

    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static void start(User user) throws Exception 
	{
		u = user;
		if (u.getRole().equals("professor"))
			teachingMap = (Map<String, ArrayList<String>>)((Professor<?,?>)user).getMap();
		ScreenUtils.createNewStage("/gui/ExamReportScreen.fxml").show();
	}
    
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setProfessorExamReportController(this);
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		searchBar.setOnKeyReleased(event -> search(event));
		ArrayList<String> arr = new ArrayList<>(); 
		String request = "send all exams to professor";
		arr.add(request);
		arr.add(u.getUser_id());
		arr.add(u.getRole());
		ClientUI.chat.accept(arr);
		if (u.getRole().equals("head"))
		{
			faceImage.setImage(new Image(getClass().getResource("/images/manager.png").toExternalForm()));
			labelImage.setImage(new Image(getClass().getResource("/images/AccessAllExamsLabel.png").toExternalForm()));
			welcomeText.setText("Department Exams");
			examCourseCol.setText("Professor Name");
		}
	}
	
	/**
	 * Disconnects from the server and closes GUI window.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(u);
	}

	/**
	 * Goes back to professor main screen.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{	
		if (u.getRole().equals("professor"))
			UserController.goBack(event, "/gui/ProfessorScreen.fxml");
		else
			UserController.goBack(event, "/gui/HeadOfDepartmentScreen.fxml");
	}
	
	/**
	 * Generates a report for the chosen exam.
	 * @param event
	 */
	@FXML
	public void GenerateReport(ActionEvent event) 
	{
	    currentEvent = event;
	    Object selectedExam = examTable.getSelectionModel().getSelectedItem();
	    if (selectedExam instanceof ExamTemplate)
	    {
	    	itemChosen = selectedExam;
	        ExamTemplate exam = (ExamTemplate) selectedExam;
	        if (u.getRole().equals("head"))
	        {
	            if (!exam.getIsActive().equals("-1"))
	            {
	                AlertMessages.makeAlert("This exam has no statistics", "View Report");
	                return;
	            }
	        }
	        ArrayList<String> request = new ArrayList<>();    
	        request.add("generate full exam report");
	        request.add(exam.get_id());
	        ClientUI.chat.accept(request);
	    }
	    else
	        AlertMessages.makeAlert("You must choose an exam to view report", "View Report");        
	}

	/**
	 * Using the professor map to set the names for courses for better user experience
	 * @param array
	 */
	private void setCourseStringsFromMap(ArrayList<ExamTemplate> array) 
	{
	    ArrayList<String> allProfessorCourses = new ArrayList<>();
	    for (ArrayList<String> courses : teachingMap.values()) 
	        allProfessorCourses.addAll(courses);
	    for (ExamTemplate exam : array) 
	    {
	        String courseString = exam.getCourse_id();
	        for (String subcategory : allProfessorCourses) 
	            if (subcategory.startsWith(courseString)) 
	                exam.setCourse_id(subcategory);
	    }
	}




    /**loading the table with the data of all the exams 
     * @param array
     */
    public void loadTable(ArrayList<ExamTemplate> array) 
    {
    	if (u.getRole().equals("professor"))
    		setCourseStringsFromMap(array);
    	arr = array;
    	examTable.getItems().clear();
		loadingColumns( "_name","_id", "course_id");
		updateExamTable(array);
	}

    
    /**
	 * Sets the exam table with the values that are currently in the eArr. 
	 * @param arrayList 
	 */
	public void updateExamTable(ArrayList<ExamTemplate> arrayList) 
	{
		try
		{
		    ObservableList<ExamTemplate> examObservableList = FXCollections.observableArrayList(arrayList);
		    examTable.setItems(examObservableList);
		}catch(Exception e) {e.printStackTrace();}
    }
    
	private void loadingColumns( String examId, String name, String course) 
	{
		try 
		{
			examIdCol.setCellValueFactory(new PropertyValueFactory<>(examId));
			examNameCol.setCellValueFactory(new PropertyValueFactory<>(name));
			examCourseCol.setCellValueFactory(new PropertyValueFactory<>(course));		
		}catch(Exception e) {e.printStackTrace();}
	}
	
	/**
	 * Opens the report screen with for the selected exam
	 * @param obj
	 */
	public void openRep(Object obj) 
	{
		try 
		{
			UserController.hide(currentEvent);
		}catch(Exception e) {e.printStackTrace();}
		reportScreen.start(currentEvent,obj,itemChosen,u);
	}
	
	
	/**
	 * This method is called when a key is released and filters the table.
	 * @param event
	 */
	void search(KeyEvent event)
	{
		String searchText = searchBar.getText().toLowerCase();
		//Filter the question list based on the search text
		ArrayList<ExamTemplate> filteredList = new ArrayList<>();
		for (Object exam : arr)
			if (((ExamTemplate) exam).get_name().toLowerCase().contains(searchText))
				filteredList.add((ExamTemplate) exam);
		//Update the question table with the filtered list
		updateExamTable(filteredList);     
	 }
}
