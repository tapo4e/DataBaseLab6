package com.example.yana6;

import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import javax.swing.*;
import javax.swing.text.TabableView;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class AppsController implements Initializable {
    @FXML
    AnchorPane anchorPane;
    private Storage storage;
    @FXML
    private TextField textFieldName = new TextField();
    @FXML
    private TextField phoneNumber = new TextField();
    @FXML
    private TextField address = new TextField();

    @FXML
    private TableView<ArrayList<String>> tableView;

    private final ObservableList<ArrayList<String>> list= FXCollections.observableArrayList();

    @FXML
    protected void Add() {
        storage = new Storage();
        if (textFieldName.getText().isEmpty() || phoneNumber.getText().isEmpty() || address.getText().isEmpty() || tableView.getSelectionModel().getSelectedItem().isEmpty()) { //проверка
            JOptionPane.showMessageDialog(null, "Данные должны быть заполнены", "alert",
                    JOptionPane.ERROR_MESSAGE);

        } else {
            storage.addDataBase(textFieldName.getText(), phoneNumber.getText(), address.getText(), tableView.getSelectionModel().getSelectedItem().get(0));
        }
    }

    @FXML
    protected void Back() throws IOException {
        anchorPane.getScene().getWindow().hide();
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("main-view.fxml"));
        loader.load();
        Parent root = loader.getRoot();
        Stage stage = new Stage();
        stage.setScene(new Scene(root));
        stage.show();
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        storage = new Storage();
        storage.setDataBase("doctor");
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