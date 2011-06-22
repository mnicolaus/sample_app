require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do 
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do 
    get '/contact' 
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have an About page at '/about'" do 
    get '/about' 
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Help page at '/help'" do 
    get '/help' 
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a Help page at '/signup'" do 
    get '/signup' 
    response.should have_selector('title', :content => "Sign Up")
  end
  
  
  it "should have the right links on the layout" do
         
          visit root_path 
          click_link "About" 
          response.should have_selector('title', :content => "About") 
          
          click_link "Help" 
          response.should have_selector('title', :content => "Help") 
          
          click_link "Contact" 
          response.should have_selector('title', :content => "Contact") 
          
          click_link "Home" 
          response.should have_selector('title', :content => "Home") 
          
          click_link "Sign up now!" 
          response.should have_selector('title', :content => "Sign Up") 
  end
  
  
  describe "Users" do   
     
     describe "signup" do
         describe "failure" do
           it "should not make a new user" do
             lambda do
               visit signup_path
               fill_in "Name", :with => ""
               fill_in "Email", :with => ""
               fill_in "Password", :with => ""
               fill_in "Confirmation", :with => ""
               click_button "Sign Up"
               response.should render_template('users/new')
               response.should have_selector("div#error_explanation")
             end.should_not change(User, :count)
           end
         end
       end
       
       
       
            describe "success" do
              it "should make a new user" do
                lambda do
                  visit signup_path
                  fill_in "Name", :with => "Example User"
                  fill_in "Email", :with => "user@example.com"
                  fill_in "Password", :with => "foobar"
                  fill_in "Confirmation", :with => "foobar"
                  click_button "Sign Up"
                  response.should have_selector("div.flash.success", :content => "Welcome")
                  response.should render_template('users/show')
                end.should change(User, :count).by(1)
              end
            end
          
    end
  
end
