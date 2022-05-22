require 'pg'
require_relative 'database_connection'

class Peep 
  
  attr_reader :user_id, :id, :peep_time, :content 

  def initialize(id: ,user_id:, content:, peep_time:)
    @id = id 
    @user_id = user_id
    @content = content 
    @peep_time = peep_time
  end 

  def self.create(content: ,user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (content, user_id) VALUES($1, $2) RETURNING id, content, user_id, peep_time;",
    [content, user_id])
    Peep.new(id: result[0]['id'], content: result[0]['content'], user_id: result[0]['user_id'], peep_time: result[0]['peep_time']) 
  end 

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep| 
    Peep.new(id: result['id'], content: result['content'], user_id: result['user_id'], peep_time: result['peep_time']) 
    end 
  end
end