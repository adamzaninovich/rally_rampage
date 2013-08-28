class Stage < ActiveRecord::Base
  has_many :stage_results
  has_many :teams, through: :stage_results

  # I spiked this to make sure that we
  # didn't need to add a 'finished'
  # column in the table, but we should
  # probably TDD this shit - Adam

  #def self.current
    #Stage.first
  #end

  #def finished?
    #if [:ideal, :speed].include? type
      #not stage_results.map(&:finish_time).include? nil
    #else

    #end
  #end
end
