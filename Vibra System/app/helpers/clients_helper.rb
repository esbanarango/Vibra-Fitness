module ClientsHelper

	def stateUserPlan(state)
		if state == "Activo"
			return "<span class='label label-success'>Activo</span>"
		end
		return "<span class='label label-important'>Vencido</span>"
	end

end
