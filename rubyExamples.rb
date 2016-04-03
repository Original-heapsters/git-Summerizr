require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'octokit'

class Summerizr

    def take_userlogin
        user_flag = false
        @username = nil
        @password = nil
        f = File.open("user-login.txt","r")
        f.each_line do |line|
            if !user_flag
                @username = line
                user_flag = true
            else 
                @password = line
            end
        end
        return @username, @password
    end

    def login_client

        #Provide authentication credentials
        Octokit.configure do |c|
            c.login = u
            c.password = p
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
 u,p =test1.take_userlogin 
 puts u
 puts p
