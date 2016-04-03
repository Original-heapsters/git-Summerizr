require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'octokit'

class Summerizr

    def initialize
        $curr_user = nil
        #Provide authentication credentials
        uName,uPass = self.get_crednetials
        
        Octokit.configure do |c|
            c.login = uName
            c.password = uPass
        end
    end
    
    def get_crednetials
    
        
        return '********','**********'
    end

    def setup_user
        
        # Fetch the current user
        $curr_user = Octokit.user
        
        puts 'before'
        
        repo = Octokit.repo 'Original-heapsters/git-Summerizr'
        rel = repo.rels[:issues]
        
                
        obj =  rel.get(:uri => {:number => 1}).data
        
        obj.each do |x| puts x end
        
        
        #curr_user.fields.each do |name|
            
            
        #    id = ":#{name}"
        #    puts id.to_str
        #    if id.to_str == ":repos_url"
            
        #        puts id
        #        info = curr_user.rels[id].get.data
        #        puts info
        #    end
        #end
        puts 'after'
    end
    
    def iterate_rel (rel_id)
    end
    
end

test1 = Summerizr.new

test1.setup_user