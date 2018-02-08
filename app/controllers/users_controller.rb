class UsersController < ApplicationController
   def show
     if current_user
       @user = current_user
       @items = @user.items
     end
   end
 end
