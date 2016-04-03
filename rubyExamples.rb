require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'octokit'

class Summerizr

    def login_client
        
        #Provide authentication credentials
        Octokit.configure do |c|
            c.login = '**********'
            c.password = '**********'
        end

        # Fetch the current user
        curr_user = Octokit.user
        
        puts 'before'
        puts curr_user.fields
        puts 'after'
    end
end

test1 = Summerizr.new

test1.login_client