/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author ACER
 */
public class Car implements Serializable{
    String carId;
    String carCatogory;
    String carName;
    double carPrice;
    double carSpeed;
    String description;
    String image;
    int status;

    public Car() {
    }

    public Car(String carId, String carCatogory, String carName, double carPrice, double carSpeed, String description, String image, int status) {
        this.carId = carId;
        this.carCatogory = carCatogory;
        this.carName = carName;
        this.carPrice = carPrice;
        this.carSpeed = carSpeed;
        this.description = description;
        this.image = image;
        this.status = status;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getCarCatogory() {
        return carCatogory;
    }

    public void setCarCatogory(String carCatogory) {
        this.carCatogory = carCatogory;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public double getCarPrice() {
        return carPrice;
    }

    public void setCarPrice(double carPrice) {
        this.carPrice = carPrice;
    }

    public double getCarSpeed() {
        return carSpeed;
    }

    public void setCarSpeed(double carSpeed) {
        this.carSpeed = carSpeed;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
