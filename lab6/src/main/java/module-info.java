module com.example.yana6 {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.desktop;
    requires  java.sql;

    opens com.example.yana6 to javafx.fxml;
    exports com.example.yana6;
}