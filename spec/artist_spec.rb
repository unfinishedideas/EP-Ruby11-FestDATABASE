require 'rspec'
require 'artist'
require('spec_helper')

describe '#Artist' do


  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it('returns == if two artists are the same') do
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => 5, :genre => 'Psychedelic'})
      artist2 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => 5, :genre => 'Psychedelic'})
      expect(artist1).to(eq(artist2))
    end
  end

  describe('#save') do
    it('Should save artists to @@artist_list') do
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => 5, :genre => 'Psychedelic'})
      artist1.save()
      expect(Artist.all).to(eq([artist1]))
    end
  end

  describe('.find') do
    it('should be able to find artists by id') do
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => 5, :genre => 'Psychedelic'})
      artist1.save()
      artist2 = Artist.new({:id => nil, :name => 'That Other Guy', :stage_id => 5, :genre => 'Classical'})
      artist2.save
      expect(Artist.find(artist2.id)).to(eq(artist2))
    end
  end

  describe('.find_by_stage') do
    it ('Should find all artists that belong to the stage') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => stage.id, :genre => 'Psychedelic'})
      artist1.save()
      artist2 = Artist.new({:id => nil, :name => 'That Other Guy', :stage_id => stage.id, :genre => 'Classical'})
      artist2.save
      expect(Artist.find_by_stage(stage.id)).to(eq([artist1, artist2]))
    end
  end

  describe('#update') do
    it('should be able to update an artist') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => stage.id, :genre => 'Psychedelic'})
      artist1.save()
      artist1.update("Rob Zombie", "Rawk", stage.id)
      expect(artist1.name).to(eq("Rob Zombie"))
    end
  end

  describe('#delete') do
    it('should delete artists successfullyyyyyyyy') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => stage.id, :genre => 'Psychedelic'})
      artist1.save()
      artist2 = Artist.new({:id => nil, :name => 'That Other Guy', :stage_id => stage.id, :genre => 'Classical'})
      artist2.save
      artist1.delete
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.clear') do
    it('should erase the list of artists') do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => stage.id, :genre => 'Psychedelic'})
      artist1.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#stage') do
    it("should find the stage by it's id") do
      stage = Stage.new({:id => nil, :name => "Nerd Stage", :location => "Shire"})
      stage.save()
      artist1 = Artist.new({:id => nil, :name => 'That One Guy', :stage_id => stage.id, :genre => 'Psychedelic'})
      artist1.save()
      expect(artist1.stage_id).to(eq(stage.id))
    end
  end

end
