require 'laying_hen'

describe LayingHen do

  let(:hen) { LayingHen.new }

  describe "#initialize" do
    context "LayingHen is created" do
      it "creates a new Hen" do
        expect(hen).to be_an_instance_of LayingHen
      end
      it "created Hen is 0 months" do
        expect(hen.age).to eq(0)
      end
    end
  end

  describe "#age!" do
    context "Increments the age of Hen" do
      it "increments the age one month" do
        hen.age!
        expect(hen.age).to eq(1)
      end
    end
  end

  describe "#any_eggs?" do
    context "Checks if any eggs have been created" do
      it "before 3 months eggs doesn't exist" do
        2.times do 
        	hen.age! 
        end
        expect(hen.any_eggs?).to be false
      end
      it "creates eggs after 3 months" do
        4.times do 
        	hen.age! 
        end
        expect(hen.any_eggs?).to be true
      end
    end
  end

  describe "#pick_an_egg!" do
    context "select an egg if exist" do
      it "if eggs doesn't exist raise an error" do
        expect {hen.pick_an_egg!}.to raise_error(NoEggsError)
      end
      it "if egg exist returns and Egg object" do
        4.times do hen.age! end
        expect(hen.pick_an_egg!).to be_an_instance_of Egg
      end
    end
  end

  describe "#old?" do
    context "Checks Hen age" do
      it "if age is less than 10 returns false" do
        5.times do hen.age! end
        expect(hen.old?).to be false
      end
      it "if age is greater than 10 returns true" do
        12.times do hen.age! end
        expect(hen.old?).to be true
      end
    end
  end

  describe "#increase_hatched_hour" do
    context "increment hatched hours randomly" do
      it "Egg hatched hours attribute is between 1 and 5" do
        4.times do hen.age! end
        hen.increase_hatched_hour(4)
        egg = hen.pick_an_egg!
        expect(egg.hatched_hours).to eq(4)
      end
    end
  end

end

describe Egg do

  let(:hen) { LayingHen.new }
  let(:egg) {  
    4.times do hen.age! end
    hen.pick_an_egg! 
  }
 
  describe "#initialize" do
    context "Egg is created" do
      it "creates object Egg" do
        expect(egg).to be_an_instance_of Egg
      end
    end
  end

  describe "#rotten?" do
    context "Checks egg status" do
      it "if egg is younger than 3 hours returns false" do
        4.times do hen.age! end
        hen.increase_hatched_hour(2)
        egg = hen.pick_an_egg!
        expect(egg.rotten?).to be false
      end
      it "if egg is older than 3 hours returns true" do
        4.times do hen.age! end
        hen.increase_hatched_hour(4)
        egg = hen.pick_an_egg!
        expect(egg.rotten?).to be true
      end
    end
  end

end

