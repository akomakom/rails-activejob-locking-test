class TestController < ApplicationController
  def index
    DeleteJob.perform_later("node1")
    CreateJob.perform_later("node1")
    DeleteJob.perform_later("node2")
    CreateJob.perform_later("node2")
    render plain: "OK"
  end
end
