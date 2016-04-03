require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'octokit'

class Summerizr

    def login_client
        
        #Provide authentication credentials
        Octokit.configure do |c|
            c.login = '*********'
            c.password = '********8'
        end

        # Fetch the current user
        curr_user = Octokit.user
        
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
end

test1 = Summerizr.new

test1.login_client