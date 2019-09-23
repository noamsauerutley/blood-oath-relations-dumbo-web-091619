# **`Cult`**

## initialize:
## * `Cult#name`
#   * returns a `String` that is the cult's name
## * `Cult#location`
#   * returns a `String` that is the city where the cult is located
## * `Cult#founding_year`
#   * returns a `Fixnum` that is the year the cult was founded
## * `Cult#slogan`
#   * returns a `String` that is this cult's slogan
## * `Cult#recruit_follower`
#   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
## * `Cult#cult_population`
#   * returns a `Fixnum` that is the number of followers in this cult
## * `Cult.all`
#   * returns an `Array` of all the cults
# * `Cult.find_by_name`
#   * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
# * `Cult.find_by_location`
#   * takes a `String` argument that is a location and returns an `Array` of cults that are in that location
# * `Cult.find_by_founding_year`
#   * takes a `Fixnum` argument that is a year and returns all of the cults founded in that year


# cult shouldn't store followers, only oaths

require 'date'
class Cult

    attr_reader :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(new_follower)
    #   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
        BloodOath.new(Date.today.to_s, self, new_follower)
    end

    def cult_population
    #   * returns a `Fixnum` that is the number of followers in this cult
        cult_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
        cult_oaths.length
    end


    def self.find_by_name(cult_name)
    #   * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
        all.find do |cult|
            cult.name == cult_name
        end
    end

    def self.find_by_location(cult_location)
    #   * takes a `String` argument that is a location and returns an `Array` of cults that are in that location
        all.select do |cult|
            cult.location == cult_location
        end
    end

    def self.find_by_founding_year(founding_year_fixnum)
    #   * takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
        all.select do |cult|
            cult.founding_year == founding_year_fixnum
        end
    end
end