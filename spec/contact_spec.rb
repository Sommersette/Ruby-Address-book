require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#first_name") do
    it("will initialize a new contact") do
      test_contact = Contact.new({:first_name => 'Bob', :last_name => 'Jo', :job_title => "lawn mower", :company => 'self employed'})
      expect((test_contact.first_name)).to(eq("Bob"))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      test_contact = Contact.new({:first_name => 'Bob', :last_name => 'Jo', :job_title => "lawn mower", :company => 'self employed'})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved contacts") do
      Contact.new({:first_name => 'Bob', :last_name => 'Jo', :job_title => "lawn mower", :company => 'self employed'}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#id") do
    it('returns contact id') do
      test_contact = Contact.new({:first_name => 'Bob', :last_name => 'Jo', :job_title => "lawn mower", :company => 'self employed'})
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe(".find") do
    it('returns contact by id') do
      test_contact = Contact.new({:first_name => 'Bob', :last_name => 'Jo', :job_title => "lawn mower", :company => 'self employed'})
      test_contact.save()
      test_contact2 = Contact.new({:first_name => 'Joe', :last_name => 'Jo', :job_title => "Grass Grower", :company => 'Best Buy'})
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end
end
