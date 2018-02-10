class CommentsController < ApplicationController
    before_action :set_idea
    before_action :set_comment, only:[:show, :edit, :update]
    
    
    def new
         @comment = Comment.new
   end

 def create
    @comment = Comment.new(comment_params.merge(idea: @idea))
    
      if @comment.save
        redirect_to idea_comments_path(@idea), notice: 'Comment was successfully'
    else 
        render :new
    end
 end
    
    
    def index
        @comments = Comment.where(idea_id: params[:idea_id])
    end  
    
    def show
    end
     
     def edit
     end
     
     def update
         if @comment.update(comment_params)
             redirect_to idea_comments_path(@idea, @comment), notice: 'Comment was successfully'
         else
             render :edit
    end
end
  
  def set_idea
      @idea = Idea.find(params[:idea_id])
  end
  
  def set_comment
      @comment = Comment.find(params[:id])
  end
  
  def comment_params
      params.require(:comment).permit(:description)
  
  end
end