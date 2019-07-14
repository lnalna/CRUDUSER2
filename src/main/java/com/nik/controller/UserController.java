package com.nik.controller;


import com.nik.entity.User;
import com.nik.service.UserService;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;



@Controller
public class UserController {
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	public UserController() {
		System.out.println("UserController()");
	}

    @Autowired
    private UserService userService;

    @RequestMapping("/createUser")
    public ModelAndView createUser(@ModelAttribute User user) {

        logger.info("Creating User. Data: "+user);

        return new ModelAndView("/userForm");
    }
    
    @RequestMapping("/editUser")
    public ModelAndView editUser(@RequestParam long id, @ModelAttribute User user) {

    	logger.info("Updating the User for the Id "+id);
        user = userService.getUser(id);

        return new ModelAndView("userForm", "userObject", user);
    }
    
    @RequestMapping("/saveUser")
    public ModelAndView saveUser(@ModelAttribute User user) {

        logger.info("Saving the User. Data : "+user);
        if(user.getId() == 0){
            userService.createUser(user);
        } else {
            userService.updateUser(user);
        }

        return new ModelAndView("redirect:getAllUsers");
    }
    
    @RequestMapping("/deleteUser")
    public ModelAndView deleteUser(@RequestParam long id) {

        logger.info("Deleting the User. Id : "+id);
        userService.deleteUser(id);

        return new ModelAndView("redirect:getAllUsers");
    }
    
    @RequestMapping(value = {"/getAllUsers", "/"})
    public ModelAndView getAllUsers() {

        logger.info("Getting the all Users.");
        List<User> userList = userService.getAllUsers();

        return new ModelAndView("/userList", "userList", userList);
    }
    
    @RequestMapping("/searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName) {

        logger.info("Searching the User. User Names: "+searchName);
    	List<User> userList = userService.getAllUsers(searchName);

        return new ModelAndView("/userList", "userList", userList);
    }
}