
# Fast configuration of the daily schedule
class ConfSchedule
	include ActiveModel::Validations
	include ActiveModel::Conversion

	attr_accessor :start_time, :end_time, :duration, :break_duration, :date, :seat_id
	validates_presence_of :start_time, :end_time, :duration, :break_duration

	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end		
	end
	
	def duration=(duration_str)
		@duration = Integer(duration_str)
	end

	def break_duration=(break_duration_str)
		@break_duration = Integer(break_duration_str)
	end

	def persisted?		
		false
	end

	def generate
		puts "Velas antes--------"
		limit = Time.parse(self.date+" "+self.end_time)
		actual = Time.parse(self.date+" "+self.start_time)
		while(limit > actual) do 
			actualEnd = actual + (self.duration*60)
			puts actual.to_s + "-" + actualEnd.to_s
			Schedule.create!(date: self.date, end_time: actualEnd.to_s , start_time: actual.to_s, seat_id: self.seat_id)
			actual = actual + (self.duration+self.break_duration)*60
		end
		
	end

end