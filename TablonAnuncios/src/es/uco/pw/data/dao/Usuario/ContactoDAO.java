package es.uco.pw.data.dao.Usuario;

import es.uco.pw.data.dao.common.DAO;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.Properties;

import es.uco.pw.business.DTO.DTOUsuario.ContactoDTO;
import es.uco.pw.business.Usuario.Contacto;

public class ContactoDAO extends DAO {

    public ContactoDAO(String sqlPropertiesPath){
        super(sqlPropertiesPath);
    }
    public int InsertarContacto(ContactoDTO contact,String password){
        int status=0;
        try{
            Connection conect = getConection();
            Properties sqlProp = new Properties();
            InputStream is = new FileInputStream(sqlPropertiesPath);
            sqlProp.load(is);
            PreparedStatement ps = conect.prepareStatement(sqlProp.getProperty("insertar.contacto"));
            ps.setString(1, contact.getEmail());
            ps.setString(2, contact.getName());
            ps.setString(3, contact.getLastName());
            java.sql.Date birthDate = new java.sql.Date(contact.getBirthDate().getTime());
            ps.setDate(4, birthDate);
            
            String intereses="";            
            for(String interes : contact.getTagsLists()){
                intereses+=interes.toLowerCase()+",";
            }
            if(contact.getTagsLists().size()>0){
                intereses=intereses.substring(0,intereses.length()-1);
            }
            ps.setString(5, intereses);
            
            status = ps.executeUpdate();

            PreparedStatement psContraseña = conect.prepareStatement(sqlProp.getProperty("insertar.Password"));
            psContraseña.setString(1, contact.getEmail());
            psContraseña.setString(2, password);
            status=psContraseña.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }

   

    public int BorrarContacto(Contacto contact){
        int status=0;
        try{
            Connection conect = getConection();
            Properties sqlProp = new Properties();
            InputStream is = new FileInputStream(sqlPropertiesPath);
            sqlProp.load(is);
            PreparedStatement ps=conect.prepareStatement(sqlProp.getProperty("borrar.contacto"));
            ps.setString(1, contact.getEmail());
            status=ps.executeUpdate();
            conect.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int ModificarContacto(ContactoDTO contactoDTO){
        int status=0;
        try{
            Connection conect = getConection();
            Properties sqlProp = new Properties();
            InputStream is = new FileInputStream(sqlPropertiesPath);
            sqlProp.load(is);
            PreparedStatement ps= conect.prepareStatement(sqlProp.getProperty("modificar.contacto"));
            ps.setString(1, contactoDTO.getName());
            ps.setString(2, contactoDTO.getLastName());
            java.sql.Date birthDate = new java.sql.Date(contactoDTO.getBirthDate().getTime());
            ps.setDate(3, birthDate);
            String intereses="";
            
            for(String interes : contactoDTO.getTagsLists()){
                interes+=interes.toLowerCase()+",";
            }
            if(contactoDTO.getTagsLists().size()>0){
                intereses=intereses.substring(0,intereses.length()-1);
            }
            ps.setString(4, intereses);
            ps.setString(5, contactoDTO.getEmail());

            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        return status;
    }

    public Hashtable<String,String> ObtenerContacto(String email){
        Hashtable<String,String> ret = new Hashtable<String,String>();
        try{
            
            Connection conect = getConection();
            
            Properties sqlProp = new Properties();
            InputStream is = new FileInputStream(sqlPropertiesPath);
            sqlProp.load(is);
            PreparedStatement ps = conect.prepareStatement(sqlProp.getProperty("getById.contacto"));
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
                 
            while(rs.next()){
                String _email=rs.getString(1);
                String _nombre=rs.getString(2);
                String _apellidos=rs.getString(3);
                java.util.Date _fechaNacimiento = new java.util.Date(rs.getDate(4).getTime());
                String _intereses=rs.getString(5);
                ret=new Hashtable<String,String>();
                ret.put("Email",_email);
                ret.put("Nombre", _nombre);
                ret.put("Apellidos",_apellidos);
                ret.put("Fecha_Nacimiento",_fechaNacimiento.toString());
                ret.put("Intereses", _intereses);
            }
            
           
        }catch(Exception e){
            System.out.println(e);
        }

        return ret;
    }



    public Contacto ObtenerContactoById(String email){
        Contacto ret = null;
        try{
            
            Connection conect = getConection();
            
            Properties sqlProp = new Properties();
          
            InputStream is = new FileInputStream(sqlPropertiesPath);
            sqlProp.load(is);
            PreparedStatement ps = conect.prepareStatement(sqlProp.getProperty("getById.contacto"));
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
                 
            while(rs.next()){
                String _email=rs.getString(1);
                String _nombre=rs.getString(2);
                String _apellidos=rs.getString(3);
                java.util.Date _fechaNacimiento = new java.util.Date(rs.getDate(4).getTime());
                String _intereses=rs.getString(5);
                ArrayList<String>temas=new ArrayList<String>(Arrays.asList(_intereses.split(",")));
                ret=new Contacto(_email, _nombre, _apellidos, _fechaNacimiento, temas);
                
            }
            
           
        }catch(Exception e){
            System.out.println(e);
        }

        return ret;
    }

    public String ObtenerPasswordUsuario(String email){
        String ret ="";
       
        try{
            Connection conect = getConection();
            
            Properties sqlProp = new Properties();
          
            InputStream is = new FileInputStream(sqlPropertiesPath);
            sqlProp.load(is);
            PreparedStatement ps = conect.prepareStatement(sqlProp.getProperty("getPassword.Usuario"));
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
                 
            rs.next();
            ret=rs.getString(1);                
         
            
        }catch(Exception e){
            e.printStackTrace();
        }

        
        
        return ret;
    }
    

}

