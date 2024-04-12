package com.example.yana6;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Storage {
    private String dataBase;


    public void addDataBase(String name, String phoneNumber, String address, String doctor_id){
        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","7969930n");
             Statement statement = connection.createStatement()) {
            System.out.println("connect");
            statement.executeUpdate("insert into patient values (DEFAULT,'"+name+"','"+address+"','"+phoneNumber+"',5)");
            statement.executeUpdate("insert into ticket values (DEFAULT, '"+doctor_id+"',( SELECT pk_id FROM patient ORDER BY pk_id DESC LIMIT 1), 'Urinary Tract Infection (UTI)', 456, '01.03.2024')");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getCount(){
        ResultSet resultSet;
        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "7969930n");
             Statement statement = connection.createStatement()) {
            resultSet=statement.executeQuery("select * from " + dataBase);
            return resultSet.getMetaData().getColumnCount();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<String>  getColumNames(){
        ArrayList<String> nameList = new ArrayList<>();
        ResultSet resultSet;
        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "7969930n");
             Statement statement = connection.createStatement()) {
            resultSet = statement.executeQuery("select * from " + dataBase);
            for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                //System.out.println(resultSet.getMetaData().getColumnName(i));
                nameList.add(resultSet.getMetaData().getColumnName(i));
            }
            } catch(SQLException e){
                throw new RuntimeException(e);
            }
        return nameList;
        }
    public List<ArrayList<String>> getData(){
        List<ArrayList<String>> data = new ArrayList<>();
            try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "7969930n");
            Statement statement = connection.createStatement()) {
                ResultSet resultSet = statement.executeQuery("select * from " + dataBase);
                int columnCount = resultSet.getMetaData().getColumnCount();
                while (resultSet.next()) {
                    ArrayList<String> row = new ArrayList<>();
                    for (int i = 1; i <= columnCount; i++) {
                        row.add(resultSet.getString(i));
                    }
                    data.add(row);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        return data;
    }

    public void DeleteData(String id){
        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "7969930n");
             Statement statement = connection.createStatement()) {
            System.out.println(getColumNames().get(0));
                    statement.executeUpdate("delete  from "+dataBase+ " where " +getColumNames().get(0)+" ='"+id+"'");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void setDataBase(String dataBase){
        this.dataBase=dataBase;
    }
}
