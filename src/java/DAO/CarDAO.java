/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Car;
import Util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class CarDAO {

    public static ArrayList<Car> getAllCar()
            throws Exception {
        ArrayList<Car> list = new ArrayList<>();
        Car c = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [carId], [carCatogory], [carName], [carPrice], [carSpeed], [description], [image], [status]\n"
                    + "FROM [dbo].[Car]\n"
                    + "WHERE [status] = 1";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    String carId = rs.getString("carId");
                    String carCatogory = rs.getString("carCatogory");
                    String carName = rs.getString("carName");
                    double carPrice = rs.getDouble("carPrice");
                    double carSpeed = rs.getDouble("carSpeed");
                    String description = rs.getString("description");
                    String img = rs.getString("image");
                    int status = rs.getInt("status");
                    c = new Car(carId, carCatogory, carName, carPrice, carSpeed, description, img, status);
                    list.add(c);
                }
            }
            st.close();
            cn.close();
        }
        return list;
    }

    public static Car searchCar(String id) throws Exception {
        Car car = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //b2: viết sql và execute
            String sql = "SELECT [carId], [carCatogory], [carName], [carPrice], [carSpeed], [description], [image], [status]\n"
                    + "FROM [dbo].[Car]\n"
                    + "WHERE [carId] = ? and [status] = 1";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String carCato = rs.getString("carCatogory");
                    String carName = rs.getString("carName");
                    double price = rs.getFloat("carPrice");
                    double speed = rs.getFloat("carSpeed");
                    String description = rs.getString("description");
                    String img = rs.getString("image");
                    int status = rs.getInt("status");
                    car = new Car(id, carCato, carName, price, speed, description, img, status);
                }
            }
            pst.close();
            cn.close();
        }
        return car;
    }
}
