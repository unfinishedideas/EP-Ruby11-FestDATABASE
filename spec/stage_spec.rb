require 'rspec'
require 'stage'
require('spec_helper')

describe '#Stage' do

  describe('#save') do
    it("Saves stage") do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage2 = Stage.new({:id => nil, :name => "Cool Stage", :location => "Your Moms House"})
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#==') do
    it('should be the same stage if they have the same attributes') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage2 = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage2.save()
      expect(stage).to(eq(stage2))
    end
  end

  describe('.clear') do
    it('should clear all the stages') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage2 = Stage.new({:id => nil, :name => "Cool Stage", :location => "Your Moms House"})
      stage2.save()
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.find') do
    it('should find the stage based on id') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage2 = Stage.new({:id => nil, :name => "Cool Stage", :location => "Your Moms House"})
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end

  describe ('.search') do
    it('should search for the right stage based on name') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage2 = Stage.new({:id => nil, :name => "Cool Stage", :location => "Your Moms House"})
      stage2.save()
      expect(Stage.search("Nerd Stage")).to(eq([stage]))
    end
  end

  describe('#update') do
    it('should update the stage info') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage.update("Hobbiten", "Shire")
      expect(stage.name).to(eq("Hobbiten"))
    end
  end

  describe('#delete') do
    it('should delete the chosen stage') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      stage2 = Stage.new({:id => nil, :name => "Cool Stage", :location => "Your Moms House"})
      stage2.save()
      stage.delete
      expect(Stage.all).to(eq([stage2]))
    end
  end

  describe('#artist') do
    it('should show what artists are playing at the stage') do
      Artist.clear
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      artist1 = Artist.new({:name => "Beyonce", :id => nil, :genre => "Hip-hop", :stage_id => stage.id})
      artist1.save
      artist2 = Artist.new({:name => "Jay-Z", :id => nil, :genre => "Hip-hop", :stage_id => stage.id})
      artist2.save
      expect(stage.artists).to(eq([artist1, artist2]))
    end
  end

end
