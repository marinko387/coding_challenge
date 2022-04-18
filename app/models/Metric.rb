require 'uri'
require 'net/http'

class Metric

  include ActiveModel::Model

  def self.get_projects
  	uri = URI('https://api.github.com/gists/47740d1d76f06aa8ced9a0db448e90a5')
	  request = Net::HTTP.get_response(uri)  
	  data = JSON.parse(request.body) if request.is_a?(Net::HTTPSuccess)
	  projects = JSON.parse(data['files']['coding_challenge_endpoint.json']['content'])
	  return projects
  end

  def self.most_bookmarked_projects(site, month)
  	projects = get_projects
    projects = projects.select  { |project| project['created_at'].to_date.month == month }
    projects = projects.keep_if { |project| project['sites'].include? site }
    projects = projects.map     { |project|  { :title =>  project['title'] , :bookmarks_count => project['bookmarks'].count } }
    projects = projects.sort_by { |project| project[:bookmarks_count] }.reverse
    projects = projects.pluck(:title)
    return projects
  end

  def self.best_performant_sites(month)
    projects = get_projects
    projects = projects.select  { |project| project['created_at'].to_date.month == month }
    projects = projects.map    { |project| project['sites'].map { |site| [site,project['pageviews']] }   }
    projects = projects.flatten(1)
    projects = projects.group_by(&:first).map{ |x, y| [y.inject(0){ |sum, i| sum + i.last }, x] }
    return projects.sort_by { |el| el[0] }.reverse
  end

  def self.bookmarks_per_month(month)
    projects = get_projects
    projects = projects.select  { |project| project['created_at'].to_date.month == month }
    projects = projects.map     { |project|  {  :bookmarks_count => project['bookmarks'].count } }
    return  projects.inject(0){|sum,x| sum + x[:bookmarks_count].to_i }
  end

end