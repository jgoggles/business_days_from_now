def self.business_days_ago(num,start_date=nil)
   # takes the number of days in the past you are looking for
   # like 10 business days ago
   start_date ||= Date.today
   start_day_of_week = start_date.cwday #Date.today.cwday
   ans = 0
   # find the number of weeks
   weeks = num / 5.0
   puts "yields #{weeks} weeks"
 
   temp_num = num > 5 ? 5 : num
   puts "first temp num #{temp_num}"
 
   begin
 
     ans += days_to_adjust(start_day_of_week,temp_num)
     puts "ans in loop #{ans}"
 
     weeks -= 1.0
     puts "weeks in loop #{weeks}"
 
     temp_num = (weeks >= 1) ? 5 : num % 5
     puts "temp_num after loop #{temp_num}"
   end while weeks > 0
 
   puts "#{start_date} + #{num} + #{ans}"
   days_ago = start_date + num + ans
 
end

# def self.days_to_adjust(start_day_of_week,num)
#    ansr = 0
#    case start_day_of_week
#    when 1
#      if (1..5).include?(num) then ansr += 2 end
#    when 2
#      if (2..5).include?(num) then ansr += 2 end
#    when 3
#      if (3..5).include?(num) then ansr += 2 end
#    when 4
#      if (4..5).include?(num) then ansr += 2 end
#    when 5
#      if 5 == num then ansr += 2 end
#    when 6
#      # no adj
#    when 7
#      if (1..5).include?(num) then ansr += 1 end
#    end
#    return ansr
# end

def self.business_days_from_now(num,start_date=nil)
   # takes the number of days in the past you are looking for
   # like 10 business days ago
   start_date ||= Date.today
   start_day_of_week = start_date.cwday #Date.today.cwday
   
   puts start_day_of_week
   
   weeks = num / 5.0
   
   temp_num = num > 5 ? 5 : num
   
   begin
    ans += days_to_adjust(start_day_of_week,temp_num)
    weeks -= 1.0
    temp_num = (weeks >= 1) ? 5 : num % 5
  end while weeks > 0
   
  puts "#{start_date} + #{num} + #{ans}"
  days_from_now = start_date + num + ans
 
end

def self.days_to_adjust(start_day_of_week,num)
   ansr = 0
   case start_day_of_week
   when 1
     unless (1..4).include?(num) then ansr += 2 end
   when 2
     unless (1..3).include?(num) then ansr += 2 end
   when 3
     unless (1..2).include?(num) then ansr += 2 end
   when 4
     unless 1 == num then ansr += 2 end
   when 5
     ansr += 2
   when 6
     ansr += 1
   when 7
     # nada
   end
   return ansr
end