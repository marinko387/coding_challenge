require 'rails_helper'

RSpec.describe Metric, type: :model do

  it 'correctly run most_bookmarked_projects method' do
  	expect(Metric.most_bookmarked_projects('cl',6)).to be_an_instance_of(Array)
  end

  it 'correctly run best_performant_sites method' do
  	expect(Metric.best_performant_sites(6)).to be_an_instance_of(Array)
  end

  it 'correctly run bookmarks_per_month method' do
  	expect(Metric.bookmarks_per_month(6)).to be_a_kind_of(Integer)
  end

end
