package com.example.yana6;


import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;

import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import javax.swing.*;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.EventObject;
import java.util.HashMap;
import java.util.ResourceBundle;

public class SearchView implements Initializable {
    @FXML
    ChoiceBox<String> choice = new ChoiceBox<>();
    private  Storage storage;
    private String parameter;
    private HashMap<String, String> map = new HashMap<>();
    @FXML
    private AnchorPane anchorPane;
    @FXML
    private TableView<ArrayList<String>> tableView;

    public SearchView()  {
    }

    @FXML
    protected void Back() throws IOException{
        anchorPane.getScene().getWindow().hide();
        FXMLLoader loader = new FXMLLoader();
         loader.setLocation(getClass().getResource("main-view.fxml"));
         loader.load();
        Parent root=loader.getRoot();
        Stage stage =new Stage();

        stage.setScene(new Scene(root));
        stage.show();
    }
    ObservableList<ArrayList<String>> list=FXCollections.observableArrayList();


    @FXML
    protected void Delete() {
        if ((tableView.getSelectionModel().isEmpty())) {
            JOptionPane.showMessageDialog(null, "Выберите данные для удаления", "alert",
                    JOptionPane.ERROR_MESSAGE);
        } else {
            String index = tableView.getSelectionModel().getSelectedItem().get(0);
            System.out.println(index);
            list.remove(tableView.getSelectionModel().getFocusedIndex());
           storage.DeleteData(index);

        }
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        map.put("доктор", "doctor");
        map.put("диагноз", "diagnosis");
        map.put("больничная палата", "hospital_ward");
        map.put("должность", "job_title");
        map.put("медикаменты", "medicaments");
        map.put("пациент", "patient");
        map.put("личное дело", "personal_file");
        map.put("рецепт", "recipe");
        map.put("талон", "ticket");
        ObservableList<String> tables = FXCollections.observableArrayList(
                "доктор",
                "диагноз",
                "больничная палата",
                "должность",
                "медикаменты",
                "пациент",
                "личное дело",
                "рецепт",
                "талон");
        choice.setItems(tables);
        storage= new Storage();
        choice.setOnAction(event-> {parameter = map.get(choice.getValue());
        setTableView();});




    }
    public void setTableView(){
        storage.setDataBase(parameter);
        tableView.getItems().clear();
        tableView.getColumns().clear();
        int counter;
        list.addAll(storage.getData());

        counter=storage.getCount();
        for(int i = 0; i <= counter - 1; i++) {
            final int indexColumn = i;
            TableColumn<ArrayList<String>, String> tableColumn = new TableColumn<>(storage.getColumNames().get(indexColumn));
            tableColumn.setCellValueFactory(param ->
                    new SimpleStringProperty(param.getValue().get(indexColumn)));

            tableView.getColumns().add(tableColumn);
        }
        tableView.setItems(list);
    }

}
