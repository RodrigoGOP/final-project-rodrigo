class VideosController < ApplicationController
  def index
    matching_videos = Video.all

    @list_of_videos = matching_videos.order({ :created_at => :desc })

    render({ :template => "videos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_videos = Video.where({ :id => the_id })

    @the_video = matching_videos.at(0)

    render({ :template => "videos/show.html.erb" })
  end

  def create
    the_video = Video.new
    the_video.owner_id = params.fetch("query_owner_id")
    the_video.video = params.fetch("query_video")
    the_video.caption = params.fetch("query_caption")
    the_video.views = params.fetch("query_views")
    the_video.viewed_by_user = params.fetch("query_viewed_by_user", false)

    if the_video.valid?
      the_video.save
      redirect_to("/videos", { :notice => "Video created successfully." })
    else
      redirect_to("/videos", { :notice => "Video failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_video = Video.where({ :id => the_id }).at(0)

    the_video.owner_id = params.fetch("query_owner_id")
    the_video.video = params.fetch("query_video")
    the_video.caption = params.fetch("query_caption")
    the_video.views = params.fetch("query_views")
    the_video.viewed_by_user = params.fetch("query_viewed_by_user", false)

    if the_video.valid?
      the_video.save
      redirect_to("/videos/#{the_video.id}", { :notice => "Video updated successfully."} )
    else
      redirect_to("/videos/#{the_video.id}", { :alert => "Video failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_video = Video.where({ :id => the_id }).at(0)

    the_video.destroy

    redirect_to("/videos", { :notice => "Video deleted successfully."} )
  end
end
