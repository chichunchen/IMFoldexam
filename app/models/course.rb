class Course < ActiveRecord::Base
  
  validates :year, :name, :teacher, :grade, :category, :presence => true
  
  validates :grade, :inclusion => 1..4

  validates :year,
    inclusion: { in: 1990..Date.today.year },
    format: { 
      with: /(19|20)\d{2}/i, 
      message: "請輸入合法的年份"
    }
end