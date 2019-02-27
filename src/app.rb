require_relative "view/ruby2d"
require_relative "model/state"
require_relative "controller/controller"



class App
  def initialize
  	@state = Model::initial_state
  end

	def start
		@view = View::Ruby2dView.new(self)
    
    Thread.new { init_timer(@view) }
    @view.start(@state)
    
	end

	def init_timer(view)
		loop do
      @state = Controller::move_snake(@state)
			view.render(@state)
			sleep 0.5
		end	
	end

	def send_action(action, params)
		new_state = Controller.send(action, @state, params)
		if new_state.hash != @state
      @state = new_state
		  @view.render(@state)
		end 
	end
end	

app = App.new
app.start