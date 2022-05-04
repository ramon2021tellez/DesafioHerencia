#requerimientos 
#implementar de acuerdo a diagrama UML
#clase padre Appointment
class Appointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end
# clase herencia MonthlyAppointment 
class MonthlyAppointment < Appointment
    attr_accessor :day
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end
    def occurs_on?(day)
        day == @day
    end
# metodo to_s origen de puts 

    def to_s
        "Reunión mensual en #{location} sobre #{purpose} el día #{day} a la(s) #{hour}:#{min}"
    end
end

class DailyAppointment < Appointment
    
    def occurs_on?(hour,min)
        @hour == hour && @min == min
    end
    def to_s
        "Reunión diaria en #{location} sobre #{purpose} a la(s) #{hour}:#{min}" 
    end

end

class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end
    #metodo occurs_on responde true or false
    def occurs_on?(day,month,year)
        @day == day && @month == month && @year == year
    end

    def to_s
        "Reunión única en #{location} sobre #{purpose} el #{day}/#{month}/#{year} a la(s) #{hour}:#{min}"
    end
end
#instanciar metodos 
aliens = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
educacion = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
trabajo = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
#mostrar frases 
puts aliens 
puts educacion
puts trabajo

#puts  trabajo.occurs_on?(4,6,2019)
#puts educacion.occurs_on?(8,15)
#puts aliens.occurs_on?(23)