package com.hemanshu;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.hemanshu.ItemService;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class LoginController {
	@Autowired
	UserRepo ur;
	
	@Autowired
	UserService userService;
	@Autowired
	EmailService emailService;
	@Autowired
	ItemService itemservice;
	
	@Autowired
	ItemRepository itemrepository;



    public List<Item> getProducts(String key){
        Iterable<Item> itemList = itemrepository.findAll();
        List<Item> resultSet = null;
        for(Item item: itemList){
        	System.out.println(item);
        	System.out.println(item.product_name + " "+ key);
            if (item.product_name.equals(key) ){
                resultSet.add(item);
                System.out.println(resultSet);
            }
            System.out.println(item.description.indexOf(key));
            if (item.description.indexOf(key)!=-1){
                resultSet.add(item);
                System.out.println(resultSet);
            }

        }
        return resultSet;
    }

	@RequestMapping("/admin")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "adminpage";
	}

	@RequestMapping("/welcome")
	public String homepage()
	{
		return "index";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
		
	}
	@RequestMapping("/signup")
	public String signup()
	{
		return "Signup";
	}

	@RequestMapping("/contact")
	public String contact()
	{
		return "contact";
	}

	@RequestMapping("/saveuser")
	public String saveuser(@ModelAttribute("user") User user,BindingResult bindingResult,HttpServletRequest request)
	{
		user.setRole("user");
		ur.save(user);
		return "index";
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute("user") User user,BindingResult bindingResult,HttpServletRequest request)
	{
		HttpSession session = request.getSession();

	   System.out.println(user.getEmailID()+"    ####"+ user.getPassword());
		if(ur.findByEmailIDAndPassword(user.getEmailID(),user.getPassword())!=null)
		{
			session.setAttribute("username", user.getEmailID());
//			System.out.print("Role in class:"+user.getRole());
			User d=ur.findByEmailIDAndPassword(user.getEmailID(),user.getPassword() );
			
			if(d.getRole().equalsIgnoreCase("admin"))
			{
				session.setAttribute("role", "admin");
				request.setAttribute("mode", "MODE_HOME");
				return "adminpage";
			}
			else {
				session.setAttribute("role", "user");
				request.setAttribute("item", itemservice.showAllitems());
				request.setAttribute("mode", "All_Products");
				return "allproducts";}
		}
		return "index";
	}
	
	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "adminpage";
	}

	@RequestMapping("/search")
	public String searchProducts(@RequestParam String key, HttpServletRequest request) {
		System.out.println("you typed "+ key);
		String[] pusher = key.split(",");
		List<Item> a = getProducts(pusher[1]);
		if (a == null)
		{
			request.setAttribute("mode", "NO_PRODUCT");
			return "allproducts";
		}
		else {
		request.setAttribute("item", a);
		request.setAttribute("mode", "SEARCH");
		return "allproducts";
		}
	}

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "adminpage";
	}
	public Item findByIDnum(int id){
		for(Item item: itemservice.showAllitems()){
			if (item.id == id) {
				return item;
			};
		}
		return null;
	}



	@RequestMapping("/buy-item")
	public String renderBuyPage(@RequestParam int id, HttpServletRequest request) {
		Item a= findByIDnum(id);
		request.setAttribute("item", a);
		request.setAttribute("mode", "ALL_USERS");
		return "buypage";
	}

	@GetMapping("/all-items")
	public String showAllItems(HttpServletRequest request) {
		request.setAttribute("item", itemservice.showAllitems());
		request.setAttribute("mode", "All_items");
		return "adminpage";
	} 
	
	@RequestMapping("/delete-item")
	public String deleteItem(@RequestParam int ID, HttpServletRequest request) {
		itemservice.deleteMyitem(ID);
		request.setAttribute("item", itemservice.showAllitems());
		request.setAttribute("mode", "All_items");
		return "adminpage";
	}

	@RequestMapping("/allproducts")
	public String allproducts(HttpServletRequest request) {
		request.setAttribute("item", itemservice.showAllitems());
		request.setAttribute("mode", "All_Products");
		return "allproducts";
	}

	@GetMapping("/allproductslist")
	public @ResponseBody
	Iterable<Item> getAllProducts()
     {
		// This returns a JSON or XML with the items

		return itemservice.showAllitems();
	}
	@RequestMapping("/email")
	public String email(HttpServletRequest request) {
		
		request.setAttribute("mode", "EMAIL");
		return "adminpage";
	}
	@RequestMapping(value="/sendemail", method=RequestMethod.POST)
	public String sendemail(@RequestParam("text") String text,@RequestParam("subject") String subject,HttpServletRequest request) {
		try {
			
			emailService.sendEmail(userService.showAllUsers(),text,subject );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("mode", "SENDEMAIL");
		return "adminpage";
	}
}
