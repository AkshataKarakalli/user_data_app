class Api::UsersController < ApplicationController
    before_action :getUser, only: [:updateUser, :deleteUser, :showUser]
    #get
    def getUsers
    user = User.all  
    if user
        render json: user, status: :ok
    else
        render json: { msg: "user Empty" }, status: :unprocessible_entity
    end
  end
  #post
    def addUser
     user = User.new(userparams)
    
       if user.save()
        render json: user, status: :ok
       else
        render json: {message: "User not added"}, status: :unprocessable_entity
       end
    end
  #show
    def showUser
      if @user
            render json: @user, status: :ok
      else
        render json: { msg: "User not found "}, status: :unprocessible_entity
      end
    end

  #put
    def updateUser
        if @user
          if @user.update(userparams)
            render json: @user, status: :ok
          else
            render json: { msg:"update failed" }, status: :unprocessible_entity
          end
        else
          render json: { msg: "User not found "}, status: :unprocessible_entity
        end
    end
  #delete
    def deleteUser
      if @user
         if @user.destroy()
             render json: { msg: "User deleted" }, status: :ok
         else
            render json: { msg:"update failed" }, status: :unprocessible_entity
         end
      else
        render json: { msg: "User not found "}, status: :unprocessible_entity
      end

    end
    
    def searchUser
          @parameter = params[:input]
          @results= User.or({firstName: /#{@parameter}/i}, {lastName: /#{@parameter}/i},{email: /#{@parameter}/i})
          render json: @results, status: :ok 
    end
    private
    def userparams
      params.permit(:firstName, :lastName, :email);
    end
    def getUser
      @user = User.find(params[:id])
    end

end
