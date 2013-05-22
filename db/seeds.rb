#Destroy all resources
Captain.destroy_all
Crew.destroy_all
Mission.destroy_all

#Create 3 captains
captain_names = ["Space Bruce", "Marvin McSpaceman", "Shaaron"]

(0..captain_names.size-1).to_a.each do |n|
  Captain.create({name: captain_names[n]})
end

#Create 3 crews
crew_names = ["The Space Marines", "The Rowdy Dudes", "2 Live Crew"]
starship_names = ["Jefferson Airplane", "Iron Maiden", "Led Zeppelin"]


(0..crew_names.size-1).to_a.each do |n|
  Crew.create( {name: crew_names[n], starship: starship_names[n] } )
end

# Create a Mission

#Get a captain

captain = Captain.first

#Get a crew

crew = Crew.last

captain.missions << crew.missions.build( {name: "Mission 1", objective: "Collect some moonrocks" } )