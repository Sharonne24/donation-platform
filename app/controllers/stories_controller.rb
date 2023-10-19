class StoriesController < ApplicationController
 # List all stories
 def index
   @stories = Story.all
   render json: @stories
 end

 # Create a new story
 def create
   @story = Story.new(story_params)
   if @story.save
     render json: @story, status: :created
   else
     render json: @story.errors, status: :unprocessable_entity
   end
 end

 # Show a specific story
 def show
   @story = Story.find(params[:id])
   render json: @story
 end

 # Edit a story
 def edit
   @story = Story.find(params[:id])
   if @story.update(story_params)
     render json: @story
   else
     render json: @story.errors, status: :unprocessable_entity
   end
 end

 # Delete a story
 def destroy
   @story = Story.find(params[:id])
   @story.destroy
   head :no_content
 end

 private

 def story_params
   params.require(:story).permit(:title, :content, :beneficiary_id)
 end
end
