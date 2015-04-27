class Seed

  def call
    generate_exercises
    generate_foods
  end

  def generate_exercises
    Exercise.create(name: "Walk - easy", pace: "2 mi/hr", mets: 2.5 )
    Exercise.create(name: "Walk - moderate", pace: "3 mi/hr", mets: 3.5 )
    Exercise.create(name: "Walk - fast", pace: "4 mi/hr", mets: 5 )
    Exercise.create(name: "Run - 10 min/mi", pace: "6 mi/hr", mets: 10 )
    Exercise.create(name: "Run - 8 min/mi", pace: "7.5 mi/hr", mets: 13.5 )
    Exercise.create(name: "Run - 6 min/mi", pace: "10 mi/hr", mets: 16 )
    Exercise.create(name: "Cycling - easy", pace: "10 mi/hr", mets: 6 )
    Exercise.create(name: "Cycling - moderate", pace: "16 mi/hr", mets: 10 )
    Exercise.create(name: "Swim - easy", pace: "light", mets: 4.5 )
    Exercise.create(name: "Swim - moderate", pace: "moderate", mets: 8)
    Exercise.create(name: "Hiking", pace: "moderate", mets: 6.5)
    Exercise.create(name: "Standing", pace: "none", mets: 1.3)
  end

  def generate_foods
    Food.create(name:"California Cheeseburger", serving: "1", brand:"Sonic", calories: 830, fat: 50)
    Food.create(name:"Jr. Chili Cheeseburger", serving: "1", brand:"Sonic", calories: 410, fat: 24)
    Food.create(name:"Spaghetti & Meatballs", serving: "1", brand:"Noddles & Company", calories: 630, fat: nil)
    Food.create(name:"Sausage and Pepperoni", serving: "1 slice", brand:"Dominoes", calories: 240, fat: nil)
    Food.create(name:"Strawberry Cheesecake", serving: "1 slice", brand:"Cheesecake Factory", calories: 700, fat: 30)
  end

  def self.call
      new.call
    end
  end

Seed.call