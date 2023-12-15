/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyectofinaloradores.dao;

import static com.proyectofinaloradores.connection.Conexion.close;
import static com.proyectofinaloradores.connection.Conexion.getConnection;
import com.proyectofinaloradores.dto.Orador;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leo_v
 */
public class OradorDAO {
    
    
    private static final String SQL_SELECT = "SELECT * FROM oradores";
    private static final String SQL_INSERT = "INSERT INTO oradores(id_orador, nombre, apellido, mail, tema) VALUES (?,?,?,?,?)";
    private static final String SQL_UPDATE = "UPDATE oradores SET nombre = ?, apellido = ?, mail = ?, tema = ? WHERE id_orador = ?";
    private static final String SQL_DELETE = "DELETE FROM oradores WHERE id_orador = ?";
    
    public List<Orador> selectOradores(){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Orador orador = null;
        List<Orador> oradores = new ArrayList();
        
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(SQL_SELECT);
            
            while(rs.next()){
                int idOrador = rs.getInt(1);
                String nombreOrador = rs.getString(2);
                String apellidoOrador = rs.getString(3);
                String mailOrador = rs.getString(4);
                String temaOrador = rs.getString(5);
                Timestamp fechaAltaOrador = rs.getTimestamp(6);
                
                orador = new Orador(idOrador, nombreOrador, apellidoOrador, mailOrador, temaOrador, fechaAltaOrador);
                oradores.add(orador);
                
                
            }
        } catch (SQLException ex){
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(rs);
                close(stmt);
                close(conn);
            } catch (SQLException ex){
                ex.printStackTrace();
            }
        }
        
        return oradores;
    }
    
    
    
    public Orador selectOrador(int id){
        
        String sql = "SELECT * FROM oradores WHERE id_orador=" + id;
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Orador orador = null;
        
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            System.out.println("SI");
            if(rs.next()){
                int idOrador = rs.getInt(1);
                String nombreOrador = rs.getString(2);
                String apellidoOrador = rs.getString(3);
                String mailOrador = rs.getString(4);
                String temaOrador = rs.getString(5);
                Timestamp fechaAltaOrador = rs.getTimestamp(6);
                
                orador = new Orador(idOrador, nombreOrador, apellidoOrador, mailOrador, temaOrador, fechaAltaOrador);
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
            System.out.println(ex.getErrorCode());
        } 
        
        return orador;
    }
    
    public void insertOradores(Orador orador){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        int registros = 0;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setInt(1, (int) orador.getId());
            stmt.setString(2, orador.getNombre());
            stmt.setString(3, orador.getApellido());
            stmt.setString(4, orador.getMail());
            stmt.setString(5, orador.getTema());
            //stmt.setTimestamp(6, orador.getFechaAlta());
            
            registros = stmt.executeUpdate();
            
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace();
            } 
        }
    }
    
    public void updateOradores(Orador orador, int id){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        int registros = 0;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setString(1, orador.getNombre());
            stmt.setString(2, orador.getApellido());
            stmt.setString(3, orador.getMail());
            stmt.setString(4, orador.getTema());
            stmt.setInt(5, id);
            
            registros = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
            
        }
        
    }
    
    public void updateOradores2(String nombre, String apellido, String mail, String tema, int id){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        int registros = 0;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setString(1, nombre);
            stmt.setString(2, apellido);
            stmt.setString(3, mail);
            stmt.setString(4, tema);
            stmt.setInt(5, id);
            
            registros = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
            
        }
        
    }
    
    public int deleteOradores(int idOrador){
    
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int registros = 0;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, idOrador);
            registros = stmt.executeUpdate();
            
        } catch (SQLException | NullPointerException ex){
            ex.printStackTrace();
        } finally {
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        
        return registros;    
    }
    
}
