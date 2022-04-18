class MetricsController < ApplicationController
	
	def most_bookmarked_projects
		render json: Metric.most_bookmarked_projects(params[:site].to_str,params[:month].to_i)
	end

	def best_performant_sites
		render json: Metric.best_performant_sites(params[:month].to_i)
	end

	def bookmarks_per_month
		render json: Metric.bookmarks_per_month(params[:month].to_i)
	end

end
