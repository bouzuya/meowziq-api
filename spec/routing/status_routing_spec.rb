require 'rails_helper'

RSpec.describe SongsController, type: :routing do
  describe 'routing' do

    it 'routes to #show' do
      expect(:get => '/status').to route_to('statuses#show')
    end

    it 'routes to #update' do
      expect(:put => '/status').to route_to('statuses#update')
    end

  end
end
