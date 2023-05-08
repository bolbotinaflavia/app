class UsersController < ApplicationController
    before_action :check_user,only: [:index, :show, :destroy]
    before_action :admin_user,only: [:destroy,:make_admin]
    before_action :check_delete_user,only:[:destroy]
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
    end

    def show
        @user = User.where(id: params[:id]).first
        if @user.present?
            @posts = @user.posts.paginate(page: params[:page], per_page: 5)
            @post = Post.new
          end
    end
    def new
    @user=User.new
    end
    def create
    @user = User.new(user_params)
    if @user.save
        flash[:succes]="User adaugat"
        log_in(@user)
        redirect_to user_path(@user)
          else
            render 'users/new' ,status: 422
    end
    end
    def make_admin
        @user=User.find(params[:id])
        @user.update(admin:true)
    end
    def check_delete_user
        @user=User.find(params[:id])
        if @user.name[0]!='A'
            redirect_to users_path
            flash[:error]='Nu incepe cu A'
        end
    end
    def destroy
        @user=User.find(params[:id])
        #if @user.name[0]=='A'
            @user.destroy
            flash[:succes]='Userul a fost sters'
            redirect_to users_path
        #else
         #   flash[:error]='Nu incepe cu A'
          #  redirect_to users_path
        #end
    end
    def following
        @title='Following'
        @user=User.find(params[:id])
        @users=@user.following.paginate(page:params[:page],per_page: 1)
        render 'show_follow',status: 422
    end
    def followers
        @title='Followers'
        @user=User.find(params[:id])
        @users=@user.followers.paginate(page:params[:page],per_page: 1)
        render 'show_follow',status: 422
    end
    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:phone_number,:gender,:age,:admin)
    end
end