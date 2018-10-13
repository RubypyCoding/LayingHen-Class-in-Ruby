#code goes here

class LayingHen

  def initialize
  end

  # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
  def age!
  end

  # Returns +true+ if the hen has laid any eggs, +false+ otherwise
  def any_eggs?
  end

  # Returns an Egg if there are any
  # Raises a NoEggsError otherwise
  def pick_an_egg!
    raise NoEggsError, "The hen has not layed any eggs" unless self.any_eggs?

    # egg-picking logic goes here
  end

  # Returns +true+ if the hen can't laid eggs anymore because of its age, +false+ otherwise.
  # The max age for a hen to lay eggs is 10 
  def old?
  end
  
  # Every hour is add to hatched hour of each egg
  def increase_hatched_hour(hours)
  end
end

class Egg
  # Initializes a new Egg with hatched hours +hatched_hours+
  def initialize
  end

  # Return +true+ if hatched hours is greater than 3, +false+ otherwise
  def rotten?
  end
end

#Standard Error


OJOOOO ---> Me quedé en las instrucciones.