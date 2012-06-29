module SchedulesHelper

	def client_status_class(machine,hStart,hEnd)
		if !machine.client.anyPlanActive?
			"expired"
		else
				hStartPlan = machine.client.plan_horary_start
				hEndPlan = machine.client.plan_horary_end
				((hStart < hStartPlan) or (hEnd > hEndPlan))? "different-time":"" 
	  end
	end

end
