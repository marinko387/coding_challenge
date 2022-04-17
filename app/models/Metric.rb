require 'uri'
require 'net/http'

class Metric

  include ActiveModel::Model

  def get_projects

  	uri = URI('https://api.github.com/gists/47740d1d76f06aa8ced9a0db448e90a5')
	request = Net::HTTP.get_response(uri)  
	data = JSON.parse(request.body) if request.is_a?(Net::HTTPSuccess)
	content = JSON.parse(data['files']['coding_challenge_endpoint.json']['content'])
	return content
  end

  def most_bookmarked_projects

  	data = get_projects
  	#return data.map {|project| project['id'] == '5bec923a08a5e5c4fe000c01'}.compact.first
  	return data.find {|project| project['id'] == '5bec923a08a5e5c4fe000c01'}

  end

end