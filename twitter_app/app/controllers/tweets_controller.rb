class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  # GET /tweets
  # GET /tweets.json
  def index
   @followers = []
   @followers_id = current_user.follows.pluck(:follower_id)
    @followers_id.map{|follower_id| @followers << User.find_by_id(follower_id)}.flatten
    @tweet = current_user.tweets.build
    @tweets = Tweet.all
    @user = User.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.build
  end

  def show_user
    @followers = []
   @followers_id = current_user.follows.pluck(:follower_id)
    @user = User.find(params["format"])
  end

  # GET /tweets/1/edit
  def edit
  end


  def follow
   @follow =  Follow.new
   @user = User.find_by_id(params[:format])
   @follow.user_id = current_user.id
   @follow.follower_id = @user.id
   @follow.save
   redirect_to root_path
  end
  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweets)
    end
end
