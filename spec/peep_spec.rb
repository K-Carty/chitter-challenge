require 'peep'

describe Peep do 
  describe '#.create' do
    it 'adds a peep to the database' do
      peep = Peep.create(content: "Peep content", user_id: 1)
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("SELECT * FROM peeps")
      
      expect(peep).to be_a Peep
      expect(result[0]['content']).to include 'Peep content'
      expect(peep.user_id).to eq result.first['user_id']
      expect(peep.content).to eq result.first['content']
    end
  end

  describe '#.all' do
    it 'returns all the peeps in the database' do
      Peep.create(content: "Peep content", user_id: 1)
      Peep.create(content: "Peep content 2", user_id: 2)
      result = Peep.all
      expect(result.last.content).to eq "Peep content 2" 
    end
  end
end
