package com.codingdojo.doctors.controllers;



import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.doctors.models.Comment;
import com.codingdojo.doctors.models.Post;
import com.codingdojo.doctors.services.DoctorService;
import com.codingdojo.doctors.services.UserService;

@Controller
public class DoctorController {
    @Autowired
    private DoctorService doctoreService;
    @Autowired
    private UserService userService;
    
//Post template render
    @GetMapping("/posts/new")
    public String newPost(@ModelAttribute("post")Post post, Principal principal, Model model) {
    	String username = principal.getName();
    	model.addAttribute("currentUser", userService.findByUsername(username));
        return "NewPost.jsp";
    }
    
    @PostMapping("/posts/new")
    public String newPost(@Valid @ModelAttribute("post")Post post, Principal principal, BindingResult result, Model model) {
    	String username = principal.getName();
    	model.addAttribute("currentUser", userService.findByUsername(username));
    	if (result.hasErrors()) {
    		return "NewPost.jsp";
    	} else {
    		
    		this.doctoreService.createPost(post);
    		return "redirect:/posts/" + post.getId();
    	}
    }
    

    //all posts
    @GetMapping("/posts")
    public String allPost(Principal principal, Model model) {
    	String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        List<Post> posts = this.doctoreService.allPosts();
        model.addAttribute("posts", posts);
        return "AllPosts.jsp";
    }

// new comment
    @GetMapping("/post/{id}")
    public String newComment(@ModelAttribute("comment")Comment comment,@PathVariable("id") Long id, Model model) {
        return "newcomment.jsp";
    }
// Doctor profile
    @GetMapping("/doctor/{id}")
    public String doctore(@PathVariable("id") Long id, Model model) {
        return "doctore.jsp";
    }
// User profile
    @GetMapping("/patient/{id}")
    public String pationt(@PathVariable("id") Long id, Model model) {
        return "pationt.jsp";
    }



}