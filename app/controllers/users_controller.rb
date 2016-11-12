class UsersController < ApiBaseController

  def index
    @users = User.all
    render json: {users: @users.map{|user| user.info}}, status: 422
  end

  def create
    @user = User.new create_params
    unless @user.save
      status = 422
      render json: {errors: @user.errors.full_messages }, status: status
    else
      render json: {user: @user.info} 
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: user.info
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy if user
    render json: {:message=> "user successfully deleted"}
  end

  private
  def create_params
    params.require(:user).permit(:fname, :lname)
  end
end

