class TestController < ApplicationController
  def index

	(1..9).each do |i|
	  DeleteJob.perform_later("node#{i}")
	  CreateJob.set(wait: 2.seconds).perform_later("node#{i}")
	end
    render plain: "OK"
  end
end
